Last login: Sat Apr 30 14:42:27 on ttys001
(base) suppakornrakna@Taps-MacBook-Pro ~ % mongosh
Current Mongosh Log ID:	626ce9b1f26c62568ea6b9a6
Connecting to:		mongodb://127.0.0.1:27017/?directConnection=true&serverSelectionTimeoutMS=2000&appName=mongosh+1.3.1
Using MongoDB:		5.0.7
Using Mongosh:		1.3.1

For mongosh info see: https://docs.mongodb.com/mongodb-shell/

------
   The server generated these startup warnings when booting:
   2022-04-30T14:16:50.441+07:00: Access control is not enabled for the database. Read and write access to data and configuration is unrestricted
------

Warning: Found ~/.mongorc.js, but not ~/.mongoshrc.js. ~/.mongorc.js will not be loaded.
  You may want to copy or rename ~/.mongorc.js to ~/.mongoshrc.js.
test> show dbs
admin    41 kB
config  111 kB
local    41 kB
test> use labdb
switched to db labdb
labdb> db.createCollection("labcollection")
{ ok: 1 }
labdb> show dbs
admin     41 kB
config   111 kB
labdb   8.19 kB
local     41 kB
labdb> show collections
labcollection
labdb> db.labcollection.insert({name:'testCreateCollection'})
DeprecationWarning: Collection.insert() is deprecated. Use insertOne, insertMany, or bulkWrite.
{
  acknowledged: true,
  insertedIds: { '0': ObjectId("626ce9e5f26c62568ea6b9a7") }
}
labdb> db.labcollection2.insert({name : 'testCreateCollection2'})
{
  acknowledged: true,
  insertedIds: { '0': ObjectId("626cea05f26c62568ea6b9a8") }
}
labdb> show collections
labcollection
labcollection2
labdb> db.labcollection.drop()
true
labdb> db.labcollection2.drop()
true
labdb> db.createCollection("stock")
{ ok: 1 }
labdb> db.stock.insert( {
    item: "tshirt", details: {
       model: "S321",
       manufacturer: "KMUTT Company" },
    stock: [ { size: "S", qty: 20 }, { size: "M", qty: 15 } ], category: "clothing",
    price:100
    } )
{
  acknowledged: true,
  insertedIds: { '0': ObjectId("626cea74f26c62568ea6b9a9") }
}
labdb> db.stock.insertMany([{item:"Jeans",details:{model:"K009",manufacturer:"Levis"},stock:[{size:"S",qty:30},{size:"M",qty:45},{size:"L",qty:30}],category:"clothing",price:230},{item:"Bowl",details:{model:"B011",manufacturer:"Superware"},stock:[{size:"S",qty:10},{size:"M",qty:23},{size:"L",qty:10}],category:"houseware",price:90},{item:"DVD",details:{model:"C122",manufacturer:"LG"},stock:[{size:"S",qty:12},{size:"M",qty:5}],category:"electronics",price:10},{item:"Egg",details:{model:"G999",manufacturer:"CPF"},stock:[{size:"S",qty:20}],category:"food",price:45}]);
{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId("626cedd1f26c62568ea6b9aa"),
    '1': ObjectId("626cedd1f26c62568ea6b9ab"),
    '2': ObjectId("626cedd1f26c62568ea6b9ac"),
    '3': ObjectId("626cedd1f26c62568ea6b9ad")
  }
}
labdb> db.stock.find( {} )
[
  {
    _id: ObjectId("626cea74f26c62568ea6b9a9"),
    item: 'tshirt',
    details: { model: 'S321', manufacturer: 'KMUTT Company' },
    stock: [ { size: 'S', qty: 20 }, { size: 'M', qty: 15 } ],
    category: 'clothing',
    price: 100
  },
  {
    _id: ObjectId("626cedd1f26c62568ea6b9aa"),
    item: 'Jeans',
    details: { model: 'K009', manufacturer: 'Levis' },
    stock: [
      { size: 'S', qty: 30 },
      { size: 'M', qty: 45 },
      { size: 'L', qty: 30 }
    ],
    category: 'clothing',
    price: 230
  },
  {
    _id: ObjectId("626cedd1f26c62568ea6b9ab"),
    item: 'Bowl',
    details: { model: 'B011', manufacturer: 'Superware' },
    stock: [
      { size: 'S', qty: 10 },
      { size: 'M', qty: 23 },
      { size: 'L', qty: 10 }
    ],
    category: 'houseware',
    price: 90
  },
  {
    _id: ObjectId("626cedd1f26c62568ea6b9ac"),
    item: 'DVD',
    details: { model: 'C122', manufacturer: 'LG' },
    stock: [ { size: 'S', qty: 12 }, { size: 'M', qty: 5 } ],
    category: 'electronics',
    price: 10
  },
  {
    _id: ObjectId("626cedd1f26c62568ea6b9ad"),
    item: 'Egg',
    details: { model: 'G999', manufacturer: 'CPF' },
    stock: [ { size: 'S', qty: 20 } ],
    category: 'food',
    price: 45
  }
]
labdb> db.stock.find( { category: 'clothing' } )
[
  {
    _id: ObjectId("626cea74f26c62568ea6b9a9"),
    item: 'tshirt',
    details: { model: 'S321', manufacturer: 'KMUTT Company' },
    stock: [ { size: 'S', qty: 20 }, { size: 'M', qty: 15 } ],
    category: 'clothing',
    price: 100
  },
  {
    _id: ObjectId("626cedd1f26c62568ea6b9aa"),
    item: 'Jeans',
    details: { model: 'K009', manufacturer: 'Levis' },
    stock: [
      { size: 'S', qty: 30 },
      { size: 'M', qty: 45 },
      { size: 'L', qty: 30 }
    ],
    category: 'clothing',
    price: 230
  }
]
labdb> db.stock.find( { category: 'clothing', price: { $lt: 100 } } )

labdb> db.stock.find( { price: { $gt: 50 } } )
[
  {
    _id: ObjectId("626cea74f26c62568ea6b9a9"),
    item: 'tshirt',
    details: { model: 'S321', manufacturer: 'KMUTT Company' },
    stock: [ { size: 'S', qty: 20 }, { size: 'M', qty: 15 } ],
    category: 'clothing',
    price: 100
  },
  {
    _id: ObjectId("626cedd1f26c62568ea6b9aa"),
    item: 'Jeans',
    details: { model: 'K009', manufacturer: 'Levis' },
    stock: [
      { size: 'S', qty: 30 },
      { size: 'M', qty: 45 },
      { size: 'L', qty: 30 }
    ],
    category: 'clothing',
    price: 230
  },
  {
    _id: ObjectId("626cedd1f26c62568ea6b9ab"),
    item: 'Bowl',
    details: { model: 'B011', manufacturer: 'Superware' },
    stock: [
      { size: 'S', qty: 10 },
      { size: 'M', qty: 23 },
      { size: 'L', qty: 10 }
    ],
    category: 'houseware',
    price: 90
  }
]
labdb> db.stock.find( { 'stock.size': 'S' } );
[
  {
    _id: ObjectId("626cea74f26c62568ea6b9a9"),
    item: 'tshirt',
    details: { model: 'S321', manufacturer: 'KMUTT Company' },
    stock: [ { size: 'S', qty: 20 }, { size: 'M', qty: 15 } ],
    category: 'clothing',
    price: 100
  },
  {
    _id: ObjectId("626cedd1f26c62568ea6b9aa"),
    item: 'Jeans',
    details: { model: 'K009', manufacturer: 'Levis' },
    stock: [
      { size: 'S', qty: 30 },
      { size: 'M', qty: 45 },
      { size: 'L', qty: 30 }
    ],
    category: 'clothing',
    price: 230
  },
  {
    _id: ObjectId("626cedd1f26c62568ea6b9ab"),
    item: 'Bowl',
    details: { model: 'B011', manufacturer: 'Superware' },
    stock: [
      { size: 'S', qty: 10 },
      { size: 'M', qty: 23 },
      { size: 'L', qty: 10 }
    ],
    category: 'houseware',
    price: 90
  },
  {
    _id: ObjectId("626cedd1f26c62568ea6b9ac"),
    item: 'DVD',
    details: { model: 'C122', manufacturer: 'LG' },
    stock: [ { size: 'S', qty: 12 }, { size: 'M', qty: 5 } ],
    category: 'electronics',
    price: 10
  },
  {
    _id: ObjectId("626cedd1f26c62568ea6b9ad"),
    item: 'Egg',
    details: { model: 'G999', manufacturer: 'CPF' },
    stock: [ { size: 'S', qty: 20 } ],
    category: 'food',
    price: 45
  }
]
labdb> db.stock.find({stock:{$elemMatch:{size:"M",qty:{$gt:10}}}});
[
  {
    _id: ObjectId("626cea74f26c62568ea6b9a9"),
    item: 'tshirt',
    details: { model: 'S321', manufacturer: 'KMUTT Company' },
    stock: [ { size: 'S', qty: 20 }, { size: 'M', qty: 15 } ],
    category: 'clothing',
    price: 100
  },
  {
    _id: ObjectId("626cedd1f26c62568ea6b9aa"),
    item: 'Jeans',
    details: { model: 'K009', manufacturer: 'Levis' },
    stock: [
      { size: 'S', qty: 30 },
      { size: 'M', qty: 45 },
      { size: 'L', qty: 30 }
    ],
    category: 'clothing',
    price: 230
  },
  {
    _id: ObjectId("626cedd1f26c62568ea6b9ab"),
    item: 'Bowl',
    details: { model: 'B011', manufacturer: 'Superware' },
    stock: [
      { size: 'S', qty: 10 },
      { size: 'M', qty: 23 },
      { size: 'L', qty: 10 }
    ],
    category: 'houseware',
    price: 90
  }
]
labdb> db.stock.find({stock:{$elemMatch:{size:'M',qty:{$gt:10}}}},{"item":1,"category":1,"price":1,"_id":0}).sort({"price":1})
[
  { item: 'Bowl', category: 'houseware', price: 90 },
  { item: 'tshirt', category: 'clothing', price: 100 },
  { item: 'Jeans', category: 'clothing', price: 230 }
]
labdb> db.stock.update(
        { item: "DVD" }, {
          $set: {
                category: "computer",
                details: { model: "D222", manufacturer: "Samsung" }
            }
      }
    )
DeprecationWarning: Collection.update() is deprecated. Use updateOne, updateMany, or bulkWrite.
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
labdb> db.stock.find( {} )
[
  {
    _id: ObjectId("626cea74f26c62568ea6b9a9"),
    item: 'tshirt',
    details: { model: 'S321', manufacturer: 'KMUTT Company' },
    stock: [ { size: 'S', qty: 20 }, { size: 'M', qty: 15 } ],
    category: 'clothing',
    price: 100
  },
  {
    _id: ObjectId("626cedd1f26c62568ea6b9aa"),
    item: 'Jeans',
    details: { model: 'K009', manufacturer: 'Levis' },
    stock: [
      { size: 'S', qty: 30 },
      { size: 'M', qty: 45 },
      { size: 'L', qty: 30 }
    ],
    category: 'clothing',
    price: 230
  },
  {
    _id: ObjectId("626cedd1f26c62568ea6b9ab"),
    item: 'Bowl',
    details: { model: 'B011', manufacturer: 'Superware' },
    stock: [
      { size: 'S', qty: 10 },
      { size: 'M', qty: 23 },
      { size: 'L', qty: 10 }
    ],
    category: 'houseware',
    price: 90
  },
  {
    _id: ObjectId("626cedd1f26c62568ea6b9ac"),
    item: 'DVD',
    details: { model: 'D222', manufacturer: 'Samsung' },
    stock: [ { size: 'S', qty: 12 }, { size: 'M', qty: 5 } ],
    category: 'computer',
    price: 10
  },
  {
    _id: ObjectId("626cedd1f26c62568ea6b9ad"),
    item: 'Egg',
    details: { model: 'G999', manufacturer: 'CPF' },
    stock: [ { size: 'S', qty: 20 } ],
    category: 'food',
    price: 45
  }
]
labdb> db.stock.update( { item: "Egg" }, { $set: { "details.manufacturer": "Betagro" } })
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
labdb> db.stock.find( {} )
[
  {
    _id: ObjectId("626cea74f26c62568ea6b9a9"),
    item: 'tshirt',
    details: { model: 'S321', manufacturer: 'KMUTT Company' },
    stock: [ { size: 'S', qty: 20 }, { size: 'M', qty: 15 } ],
    category: 'clothing',
    price: 100
  },
  {
    _id: ObjectId("626cedd1f26c62568ea6b9aa"),
    item: 'Jeans',
    details: { model: 'K009', manufacturer: 'Levis' },
    stock: [
      { size: 'S', qty: 30 },
      { size: 'M', qty: 45 },
      { size: 'L', qty: 30 }
    ],
    category: 'clothing',
    price: 230
  },
  {
    _id: ObjectId("626cedd1f26c62568ea6b9ab"),
    item: 'Bowl',
    details: { model: 'B011', manufacturer: 'Superware' },
    stock: [
      { size: 'S', qty: 10 },
      { size: 'M', qty: 23 },
      { size: 'L', qty: 10 }
    ],
    category: 'houseware',
    price: 90
  },
  {
    _id: ObjectId("626cedd1f26c62568ea6b9ac"),
    item: 'DVD',
    details: { model: 'D222', manufacturer: 'Samsung' },
    stock: [ { size: 'S', qty: 12 }, { size: 'M', qty: 5 } ],
    category: 'computer',
    price: 10
  },
  {
    _id: ObjectId("626cedd1f26c62568ea6b9ad"),
    item: 'Egg',
    details: { model: 'G999', manufacturer: 'Betagro' },
    stock: [ { size: 'S', qty: 20 } ],
    category: 'food',
    price: 45
  }
]
labdb> db.stock.remove({ category : "clothing" })
DeprecationWarning: Collection.remove() is deprecated. Use deleteOne, deleteMany, findOneAndDelete, or bulkWrite.
{ acknowledged: true, deletedCount: 2 }
labdb> db.stock.find( {} )
[
  {
    _id: ObjectId("626cedd1f26c62568ea6b9ab"),
    item: 'Bowl',
    details: { model: 'B011', manufacturer: 'Superware' },
    stock: [
      { size: 'S', qty: 10 },
      { size: 'M', qty: 23 },
      { size: 'L', qty: 10 }
    ],
    category: 'houseware',
    price: 90
  },
  {
    _id: ObjectId("626cedd1f26c62568ea6b9ac"),
    item: 'DVD',
    details: { model: 'D222', manufacturer: 'Samsung' },
    stock: [ { size: 'S', qty: 12 }, { size: 'M', qty: 5 } ],
    category: 'computer',
    price: 10
  },
  {
    _id: ObjectId("626cedd1f26c62568ea6b9ad"),
    item: 'Egg',
    details: { model: 'G999', manufacturer: 'Betagro' },
    stock: [ { size: 'S', qty: 20 } ],
    category: 'food',
    price: 45
  }
]
labdb> db.stock.remove( {} )
{ acknowledged: true, deletedCount: 3 }
labdb> db.stock.drop()
true
labdb> db.dropDatabase()
{ ok: 1, dropped: 'labdb' }
labdb> 
