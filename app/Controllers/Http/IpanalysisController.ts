'use strict';
import view from '@ioc:Adonis/Core/View';
import Hash from 'App/Models/Hash'; 
import IPAddress from 'App/Models/Ipaddress';

const axios = require('axios');

class HomeController {
  async submit({ request, response }) {
    try {
      const hashValue = request.input('hash');
      
      const existingHash = await Hash.query()
      .where('hash', hashValue)
      .first()

      if (existingHash){
        // Render the 'ipanalysis' view with the hash and JSON data
        console.log("%c🥳 Your hash is already here! 🥳", "color: #FF69B4;")
        return this.renderIpAnalysis({ view, hashValue })
      }else{
        //Query Virus Total for IPs contacted by executable
        console.log("%c🔎 Contacting Virus Total ✨\n", "color: #7DF9FF;")
        const contactedIPs = await this.virusTotal(hashValue, response)
        console.log("%c😘 Thank you for the data VT 🥰\n\n", "color: #7DF9FF;")

        //Query AbuseIPDB for reputational scores
        console.log("%c🔎 Contacting AbuseIPDB ✨\n", "color: #7DF9FF;")
        const reputationIPs = await this.abuseIPDB(contactedIPs,response)
        console.log("%c😘 Thank you for the data AIPDB 🥰\n\n", "color: #7DF9FF;")
        
        //Query ip-api for most current location information on the IP
        console.log("%c🔎 Contacting IP-API ✨\n", "color: #7DF9FF;")
        const geolocationIPs = await this.ipapi(contactedIPs,response)
        console.log("%c😘 Thank you for the data IPAPI 🥰\n\n", "color: #7DF9FF;")

        //Query alienvault for any threat intelligence info (pulses)
        console.log("%c🔎 Contacting Alienvault OTX, please be patient! ✨\n", "color: #7DF9FF;")
        const pulses = await this.alienVault(contactedIPs,response)
        console.log("%c👽 Thank you for the data OTX 👽\n\n", "color: #7DF9FF;")

        //update DB
        console.log("%c😵‍💫 Updating the Mainframe 😵‍💫\n", "color: #00FF00;")
        await this.updateDatabase(contactedIPs, hashValue, reputationIPs, geolocationIPs, pulses, response)
        console.log("%c💚 Mainframe Updated 💚\n\n", "color: #00FF00;")

        // Render the 'ipanalysis' view with the hash and JSON data
        console.log("%c☕👾 Thanks for visiting the Malware Cafe 👾☕", "color: #FF69B4;")
        return this.renderIpAnalysis({ view, hashValue })
      }
    } catch (error) {
      console.error(error);
      return response.status(500).send('An error occurred when querying VT API')
    }
  }
  
  async virusTotal(hashValue,response){
    try{
      // VT Req
      const apiUrl = `https://www.virustotal.com/api/v3/files/${hashValue}/contacted_ips`;
      const apiKey = '06a9a852b9d174bf852012a25c6a39ab4ae42d10db8f5ae8e3bd0da665a30a61';
      const headers = {
        'x-apikey': apiKey,
      };

      const { data: jsonData } = await axios.get(apiUrl, { headers });

      // Extract IP addresses from the VirusTotal response
      return jsonData.data.map(ipapi => ipapi.id);

    }catch (error) {
      console.error(error);
      return response.status(500).send('Error Querying VirusTotal');
    }
  }

  async abuseIPDB(contactedIPs,response){
    try{
      type ResultType = {
        ipAddress: string;
        abuseConfidenceScore: number;
      };
      let results: ResultType[] = [];  // Declare the array with the correct type

      for (const ipAddress of contactedIPs) { 
        const apiUrl = `https://api.abuseipdb.com/api/v2/check?ipAddress=${ipAddress}&maxAgeInDays=365`;
        const apiKey = 'e22cfdc8587f17a3186b67a07608a7be7e3b298be923bdef29e44ccc7bbba736f4f4a25435ac9445';
        const headers = {
          'Key': apiKey,
        };

        const { data: jsonData } = await axios.get(apiUrl, { headers });

        results.push({
          ipAddress: jsonData.data.ipAddress,
          abuseConfidenceScore: jsonData.data.abuseConfidenceScore
        }); 

      }
      return results;

    } catch (error) {
      console.error(error);
      return response.status(500).send('An error occurred when querying AbuseIPDB API');
    }
  }

  async ipapi(contactedIPs, response){
    try{
      type ResultType = {
        ipAddress: string;
        lat: string;
        lon: string;
      };
      let results: ResultType[] = [];  

      for (const ipAddress of contactedIPs) { 
        const apiUrl = `http://ip-api.com/json/${ipAddress}`;
        const { data: jsonData } = await axios.get(apiUrl);

        results.push({
          ipAddress: jsonData.query,
          lat: jsonData.lat,
          lon: jsonData.lon
        }); 
      }
      return results;

    } catch (error) {
      console.error(error);
      return response.status(500).send('An error occurred when querying ipapi API');
    }
  }

  async alienVault(contactedIPs, response){
    try{
      type ResultType = {
        ipAddress: string;
        pulses: string;
      };

      const apiKey = 'ffc59cc4a0d81576872124ad8e44a9bb9bc556e0bc033c8288bac0424c4b6b71';
        const headers = {
          'X-OTX-API-KEY': apiKey,
        };

        //alienvault is very slow so need to make requests concurrently
        const fetchPromises = contactedIPs.map(async (ipAddress) => {
          const apiUrl = `https://otx.alienvault.com/api/v1/search/pulses?q=${ipAddress}`;
          const { data: jsonData } = await axios.get(apiUrl, { headers });
          const pulseNames = jsonData.results.map((pulse: any) => pulse.name);
          return {
              ipAddress: ipAddress,
              pulses: pulseNames,
          };
      });

      // wait for promises to resolve
      const results: ResultType[] = (await Promise.all(fetchPromises)).filter(Boolean); 
      return results;

    } catch (error) {
      console.error(error);
      return response.status(500).send('An error occurred when querying alienvault API');
    }
  }

  async getColor(abuseConfidenceScore) {
    if (abuseConfidenceScore >= 50) return 'red'; 
    if (abuseConfidenceScore > 0) return 'orange'; 
    return 'green'; 
  }

  async updateDatabase(contactedIPs, hashValue, reputationIPs, geolocationIPs, pulses, response) {
    try {
      // Put hash in the database
      const hash = await Hash.firstOrCreate({ hash: hashValue });

      // MAPS
      const reputationMap = new Map();
      for (const rep of reputationIPs) {
          reputationMap.set(rep.ipAddress, rep.abuseConfidenceScore);
      }
      const geolocationMap = new Map();
      for (const geo of geolocationIPs) {
        geolocationMap.set(geo.ipAddress, { lat: geo.lat, lon: geo.lon });
      }

      const pulsesMap = new Map();
      for (const pulseRecord of pulses) {
          pulsesMap.set(pulseRecord.ipAddress, JSON.stringify(pulseRecord.pulses));
      }

      // Update IPs in the database
      for (const ipAddress of contactedIPs) { 
        const abuseConfidenceScore = reputationMap.get(ipAddress)
        const geolocation = geolocationMap.get(ipAddress) 
        const colour = await this.getColor(abuseConfidenceScore)

        //check if IP exsists
        const existingRecord = await IPAddress.query()
        .where('ip', ipAddress)
        .andWhere('hash_id', hash.id)
        .first();
      
        if(!existingRecord){
          await IPAddress.create({
            hash_id: hash.id,
            ip: ipAddress,
            abuse_reputation: abuseConfidenceScore,
            geolocation: {
              lat: geolocation.lat,
              lon: geolocation.lon
            },
            colour: colour,
            pulses: pulsesMap.get(ipAddress) || "[]"
          });
        }
      }
    } catch (error) {
      console.error(error);
      return response.status(500).send('An error occurred when updating the database');
    }
  }

  async renderIpAnalysis({ view, hashValue }) {
    // Fetch the associated hash and IP addresses from the database
    const hash = await Hash.findBy('hash', hashValue);
    if (!hash) {
      throw new Error('Hash not found'); 
    }

    const contactedIPs = await IPAddress
    .query()
    .where('hash_id',hash.id)
    
    return view.render('ipanalysis', { contactedIPs, hash });
  }
}
module.exports = HomeController;
