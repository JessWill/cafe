import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import ViewCounterModel from 'App/Models/ViewCounter';
import View from '@ioc:Adonis/Core/View'

export default class ViewCounter {
  public async handle({}: HttpContextContract, next: () => Promise<void>) {
    try{
      await ViewCounterModel
      .query()
      .where('id', 1)
      .increment('count', 1);

      const viewCount = await ViewCounterModel.find(1)
      View.global('viewCount', viewCount)

      } catch (error){
      console.log(error)
    }
    finally{
      await next()
    }
  }
}
