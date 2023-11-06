
import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import IPAddress from 'App/Models/Ipaddress';

export default class SearchController {
  public async handleSearch({ request, view }: HttpContextContract) {
    const keyword = request.input('keyword');

    const searchResults = await IPAddress
    .query()
    .from('ipaddresses')
    .whereRaw("CAST(pulses AS TEXT) ILIKE '%' || ? || '%'", [keyword])
    .select('ip', 'pulses');

    return view.render('search', { searchResults });
  }
}

