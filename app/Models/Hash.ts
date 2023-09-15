import { BaseModel, column, manyToMany, ManyToMany } from "@ioc:Adonis/Lucid/Orm";
import IPAddress from "App/Models/Ipaddress"; 

export default class Hash extends BaseModel {
  @column({ isPrimary: true })
  public id: number;

  @column()
  public hash_value: string;

  static table = 'hashes';
  static primaryKey = 'id';

  static fillable = ['hash_value'];

  // relationships
  @manyToMany(() => IPAddress, {
    pivotTable: "hash_ipaddress", // Specify the pivot table name
    pivotForeignKey: "hash_id", // Specify the foreign key in the pivot table for Hash
    pivotRelatedForeignKey: "ipaddress_id", // Specify the foreign key in the pivot table for IPAddress
  })
  public ipAddresses: ManyToMany<typeof IPAddress>;
}

module.exports = Hash;
