'use strict';
import View from '@ioc:Adonis/Core/View';

const axios = require('axios');

class HomeController {
  async submit({ request, response }) {
    try {
      const hash = request.input('hash');

      // VT Req
      const apiUrl = `https://www.virustotal.com/api/v3/files/${hash}/contacted_ips`;
      const apiKey = '06a9a852b9d174bf852012a25c6a39ab4ae42d10db8f5ae8e3bd0da665a30a61';
      const headers = {
        'x-apikey': apiKey,
      };

      const { data: jsonData } = await axios.get(apiUrl, { headers });

      // Extract IP addresses from the VirusTotal response
      const contactedIPs = jsonData.data.map(ipInfo => ipInfo.id);

      // Render the 'ipanalysis' view with the hash and JSON data
      return View.render('ipanalysis', { contactedIPs, hash });

    } catch (error) {
      console.error(error);
      return response.status(500).send('An error occurred');
    }
  }

  // ... Other methods ...
}

module.exports = HomeController;
