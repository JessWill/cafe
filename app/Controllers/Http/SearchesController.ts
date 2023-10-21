
import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import IPAddress from 'App/Models/Ipaddress';

export default class SearchController {
  public async handleSearch({ request, view }: HttpContextContract) {
    const keyword = request.input('keyword');

    // Perform the search operation, e.g., query your database
    // This is a simplified example; your actual search logic may differ
    const searchResults = await IPAddress
    .query()
    .from('ipaddresses')
    .whereRaw("CAST(pulses AS TEXT) ILIKE '%' || ? || '%'", [keyword])
    .select('ip', 'pulses');

    // Render the same view with results
    console.log(searchResults)
    return view.render('search', { searchResults });
  }
}

