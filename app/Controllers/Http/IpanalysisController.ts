'use strict';
import view from '@ioc:Adonis/Core/View';
import Hash from 'App/Models/Hash'; 
import IPAddress from 'App/Models/Ipaddress';

const axios = require('axios');

class HomeController {
  async submit({ request, response }) {
    try {
      const hashValue = request.input('hash');

      // VT Req
      const apiUrl = `https://www.virustotal.com/api/v3/files/${hashValue}/contacted_ips`;
      const apiKey = '06a9a852b9d174bf852012a25c6a39ab4ae42d10db8f5ae8e3bd0da665a30a61';
      const headers = {
        'x-apikey': apiKey,
      };

      const { data: jsonData } = await axios.get(apiUrl, { headers });

      // Extract IP addresses from the VirusTotal response
      const contactedIPs = jsonData.data.map(ipInfo => ipInfo.id);

      //updateDB
      await this.updateDatabase(contactedIPs, hashValue, response)

      // Render the 'ipanalysis' view with the hash and JSON data
      return this.renderIpAnalysis({ view, hashValue });

    } catch (error) {
      console.error(error);
      return response.status(500).send('An error occurred when querying API');
    }
  }

  async updateDatabase(contactedIPs, hashValue, response) {
    try {
      // Put hash in the database
      let hash = await Hash.firstOrCreate({ hash_value: hashValue });
  
      // Update IPs in the database
      for (const ipAddress of contactedIPs) {
        const ipData = {
          ipAddress: ipAddress.ipAddress,
          hashId: hash.id, 
        };
  
        await IPAddress.updateOrCreate(
          { ipAddress: ipAddress.ipAddress }, 
          ipData
        );   
      }
    } catch (error) {
      console.error(error);
      return response.status(500).send('An error occurred when updating the database');
    }
  }

  async renderIpAnalysis({ view, hashValue }) {
    
    // Fetch the associated hash and IP addresses from the database
    const hash = await Hash.findBy('hash', hashValue);
    const contactedIPs = await IPAddress.findBy('hash', hash?.id)

    return view.render('ipanalysis', { contactedIPs, hash });
  
  }
}
module.exports = HomeController;
