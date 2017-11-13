require "granite_orm/adapter/mysql"

class Order < Granite::ORM::Base
  adapter mysql
  table_name orders
  has_many :order_products

  ORDER_STATUSES = {  Int8.new(0)  => { n: "Обработка"      ,c: "#000"   ,p: 20 },
                      Int8.new(1)  => { n: "Везём"          ,c: "#6CB6FF",p: 30 },
                      Int8.new(2)  => { n: "Сделали"        ,c: "#99ff33",p: 40 },
                      Int8.new(3)  => { n: "Слили"          ,c: "#f63"   ,p: 50 },
                      Int8.new(4)  => { n: "Можно везти"    ,c: "#FFff6b",p: 60 },
                      Int8.new(5)  => { n: "Перезвонить"    ,c: "#ff99cc",p: 70 },
                      Int8.new(6)  => { n: "Ждем"           ,c: "#99ffff",p: 80 },
                      Int8.new(7)  => { n: "Не выполнен"    ,c: "#99cc99",p: 90 },
                      Int8.new(8)  => { n: "Доставлен"      ,c: "#bbffbb",p: 10 },
                      Int8.new(9)  => { n: "Не доставлен"   ,c: "#bbffbb",p: 15 },
                      Int8.new(100)=> { n: "В офисе"        ,c: "#990099",p: 9  },
                      Int8.new(10) => { n: "Закупка"        ,c: "#2463b2",p: 1  },
                      Int8.new(11) => { n: "Проверка оплаты",c: "#9ff"   ,p: 2  },
                      Int8.new(12) => { n: "Собираем товар" ,c: "#e7c43a",p: 35 } }

  id : Int64 # primary key is created for you
  field name : String
  field number : Int32
  field status : Int8
  field k_status : Int8
  
  field manager_id : Int16
  field coordnator_id : Int16
  field purchase_id : Int16
  
  field reklama_id : Int16
  field delivery_accept : Int8
  field important : Int8
  field call_waiting : Int8
  field time_to : Int8
  field call_waiting : Int8
  
  field delivery_submit : Time
  
  field add_time : Time
  # field status : Slice(UInt8)
  # field name : String
  timestamps

  @cached_prods = [] of OrderProduct
  @cached_prods_ready : Bool = false

  # getter itogo_

  def prods
    return @cached_prods if @cached_prods_ready
    @cached_prods_ready = true
    old_size = @cached_prods.size.to_s
    # puts "\n size=[#{ @cached_prods.size.to_s }] cache prods for id=[#{ @id.to_s }] \n"
    @cached_prods = order_products()
    puts "\n size=[#{ @cached_prods.size.to_s }] cache prods for id=[#{ @id.to_s }] old_size=[#{old_size}]\n"
    @cached_prods
  end

  def push_order_prod(op : OrderProduct)
    @cached_prods.push(op)
  end

  def set_prods_cache_ready
    @cached_prods_ready = true
  end

  def get_sklads_sum
    result : Hash(Int64, Int64) = {} of Int64 => Int64
    prods.each do |p|
      sklad : Int64 = (p.sklad_from_id || 0).to_i64
      price : Float32 = (p.price_zakup || "0").to_f32? || 0.to_f32
      next unless sklad > 0 && (p.qty || 0) > 0 && price> 0 || Utils.arr_i8([5, 6]).includes?(p.status_id)
      result[sklad] = 0.to_i64 if result[sklad]?.nil?
      result[sklad] += ((p.qty || 0) * price).trunc.to_i64
    end
    result
  end

  def start_in_hour
    if (Time.now + 1.hour) > ((add_time || Time.now).date + time_to.hour)

    end
    # (DATE_ADD(NOW(), INTERVAL 1 HOUR)>DATE_ADD(DATE(o.add_time),INTERVAL o.time_to HOUR)) as in_hour
  end

  def self.with_prods(clause : String)
    orders = Order.all(clause)
    OrderProduct.all("WHERE (id IS NOT NULL) AND order_id IN (SELECT id FROM orders " + clause + ")").each do |op|
      # order = orders.find { |o| o.id == op.order_id }
      order = orders.find { |o| o.id == op.order_id }
      order.push_order_prod(op) unless order.nil?
    end
    orders.each { |x| x.set_prods_cache_ready() }
    orders
  end
end
