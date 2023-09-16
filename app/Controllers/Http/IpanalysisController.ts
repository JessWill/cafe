'use strict';
import view from '@ioc:Adonis/Core/View';
import Hash from 'App/Models/Hash'; 
import IPAddress from 'App/Models/Ipaddress';

const axios = require('axios');

class HomeController {
  async submit({ request, response }) {
    try {
      const hashValue = request.input('hash');
      
      //Query Virus Total
      console.log("Contacting Virus Total!")
      const contactedIPs = await this.virusTotal(hashValue, response)
      console.log("Virus Total Contact Complete!")

      //Query AbuseIPDB
      console.log("Contacting AbuseIPDB!")
      const reputationIPs = await this.abuseIPDB(contactedIPs,response)
      console.log("Contacting AbuseIPDB Complete!")
      
      //update DB
      console.log("Updating DB!")
      await this.updateDatabase(contactedIPs, hashValue, reputationIPs, response)
      console.log("Updating DB Complete!")

      // Render the 'ipanalysis' view with the hash and JSON data
      console.log("Beginning analysis")
      return this.renderIpAnalysis({ view, hashValue });

    } catch (error) {
      console.error(error);
      return response.status(500).send('An error occurred when querying VT API');
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
      return jsonData.data.map(ipInfo => ipInfo.id);

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

  async updateDatabase(contactedIPs, hashValue, reputationIPs, response) {
    try {
      console.log("Inserting Hash!")
      // Put hash in the database
      const hash = await Hash.firstOrCreate({ hash: hashValue });
      console.log("Inserting Hash complete!")

      // Turning reputations into a map
      const reputationMap = new Map();
      for (const rep of reputationIPs) {
          reputationMap.set(rep.ipAddress, rep.abuseConfidenceScore);
      }

      // Update IPs in the database
      for (const ipAddress of contactedIPs) { 
        const abuseConfidenceScore = reputationMap.get(ipAddress);
        await IPAddress.firstOrCreate({
          hash_id: hash.id,
          ip: ipAddress,
          abuse_reputation: abuseConfidenceScore
      });
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
    console.log("Complete!")
    console.log("IP Address query!")

    const contactedIPs = await IPAddress
    .query()
    .where('hash_id',hash.id)
    
    console.log("Complete!")

    return view.render('ipanalysis', { contactedIPs, hash });
  }
}
module.exports = HomeController;
