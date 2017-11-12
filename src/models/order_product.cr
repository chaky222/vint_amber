require "granite_orm/adapter/mysql"

class OrderProduct < Granite::ORM::Base
  adapter mysql
  table_name orders_products
  belongs_to :order

  ORDER_PRODS_STATUSES = {  Int8.new(0)  => { n: "Обработка",c: "#000"   ,p: 20 },
                            Int8.new(1)  => { n: "Вернули"  ,c: "#cf0"   ,p: 30 },
                            Int8.new(2)  => { n: "Завис"    ,c: "#f22"   ,p: 40 },
                            Int8.new(3)  => { n: "У клиента",c: "#2f2"   ,p: 50 },
                            Int8.new(4)  => { n: "Везем"    ,c: "#6CB6FF",p: 60 },
                            Int8.new(5)  => { n: "Не брали" ,c: "#ccc"   ,p: 70 },
                            Int8.new(6)  => { n: "Удалён"   ,c: "#yellow",p: 80 } }

  id : Int64 # primary key is created for you
  field name : String
  field order_id : Int64
  # field status_id : Int32
  # field qty : Float32
  # field status : Slice(UInt8)
  # field name : String
  timestamps
end
