require "granite_orm/adapter/mysql"

class Order < Granite::ORM::Base
  adapter mysql
  table_name orders

  ORDER_STATUSES = {  "0":  { n: "Обработка"      ,c: "#000"   ,p: 20 },
                      "1":  { n: "Везём"          ,c: "#6CB6FF",p: 30 },
                      "2":  { n: "Сделали"        ,c: "#99ff33",p: 40 },
                      "3":  { n: "Слили"          ,c: "#f63"   ,p: 50 },
                      "4":  { n: "Можно везти"    ,c: "#FFff6b",p: 60 },
                      "5":  { n: "Перезвонить"    ,c: "#ff99cc",p: 70 },
                      "6":  { n: "Ждем"           ,c: "#99ffff",p: 80 },
                      "7":  { n: "Не выполнен"    ,c: "#99cc99",p: 90 },
                      "8":  { n: "Доставлен"      ,c: "#bbffbb",p: 10 },
                      "9":  { n: "Не доставлен"   ,c: "#bbffbb",p: 15 },
                      "100":{ n: "В офисе"        ,c: "#990099",p: 9  },
                      "10": { n: "Закупка"        ,c: "#2463b2",p: 1  },
                      "11": { n: "Проверка оплаты",c: "#9ff"   ,p: 2  },
                      "12": { n: "Собираем товар" ,c: "#e7c43a",p: 35 } }

  id : Int64 # primary key is created for you
  field name : String
  field number : Int32
  field status : Int32
  field add_time : Time
  # field status : Slice(UInt8)
  # field name : String
  timestamps
end
