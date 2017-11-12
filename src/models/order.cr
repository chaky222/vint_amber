require "granite_orm/adapter/mysql"

class Order < Granite::ORM::Base
  adapter mysql
  table_name orders
  has_many :order_products

  ORDER_STATUSES = {  UInt8.new(0)  => { n: "Обработка"      ,c: "#000"   ,p: 20 },
                      UInt8.new(1)  => { n: "Везём"          ,c: "#6CB6FF",p: 30 },
                      UInt8.new(2)  => { n: "Сделали"        ,c: "#99ff33",p: 40 },
                      UInt8.new(3)  => { n: "Слили"          ,c: "#f63"   ,p: 50 },
                      UInt8.new(4)  => { n: "Можно везти"    ,c: "#FFff6b",p: 60 },
                      UInt8.new(5)  => { n: "Перезвонить"    ,c: "#ff99cc",p: 70 },
                      UInt8.new(6)  => { n: "Ждем"           ,c: "#99ffff",p: 80 },
                      UInt8.new(7)  => { n: "Не выполнен"    ,c: "#99cc99",p: 90 },
                      UInt8.new(8)  => { n: "Доставлен"      ,c: "#bbffbb",p: 10 },
                      UInt8.new(9)  => { n: "Не доставлен"   ,c: "#bbffbb",p: 15 },
                      UInt8.new(100)=> { n: "В офисе"        ,c: "#990099",p: 9  },
                      UInt8.new(10) => { n: "Закупка"        ,c: "#2463b2",p: 1  },
                      UInt8.new(11) => { n: "Проверка оплаты",c: "#9ff"   ,p: 2  },
                      UInt8.new(12) => { n: "Собираем товар" ,c: "#e7c43a",p: 35 } }

  id : Int64 # primary key is created for you
  field name : String
  field number : Int32
  field status : Int32
  field add_time : Time
  # field status : Slice(UInt8)
  # field name : String
  timestamps

  def prod_cnt
    # order_products.size
  end


end
