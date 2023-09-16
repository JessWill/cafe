import { BaseModel, column, manyToMany, ManyToMany } from "@ioc:Adonis/Lucid/Orm";
import IPAddress from "App/Models/Ipaddress"; 
import { DateTime } from 'luxon'

export default class Hash extends BaseModel {
  @column({ isPrimary: true })
  public id: number;

  @column()
  public hash: string;

  @column.dateTime({ autoCreate: true })
  public created_at: DateTime;

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updated_at: DateTime;

  static table = 'hashes';
  static primaryKey = 'id';

  static fillable = ['hash'];

  // relationships
   @manyToMany(() => IPAddress, {
    pivotTable: "hash_ipaddress", 
    pivotForeignKey: "id", 
    pivotRelatedForeignKey: "id", 
  })
  public ipAddresses: ManyToMany<typeof IPAddress>;
}

module.exports = Hash;
