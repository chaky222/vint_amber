

class Admin::OrderController < AdminController
  def index
    puts "\n\n index \n\n\n"
    managers = User.managers
    manager_list = params["managers"]? ? params["managers"].split(",") : ["nobody", context.data[:user_id].to_s]
    # puts "\n\n current=[#{Amber.database.inspect}] \n\n"
    period = Utils::Period.by_date_range_str(params["date_range"]?, { default: :today })
    if !period
      main_text = "Неверно указана дата [#{params["date_range"]?}]."
      return params["form_by_ajax"]? ? to_json_main_text(main_text, "Заказы") : render("index.slang")
    end
    puts "\n\n period=[#{period.inspect}] \n\n"

    open_list = params["open"]? ? params["open"].split(",") : [Time.now.to_s("%Y-%m-%d")]
    where = "WHERE (id IS NOT NULL) AND (add_time #{period.to_sql})"
    where += " AND (manager_id IN (#{ manager_list.map { |x| x.to_i.to_s }.join(",") }))" unless manager_list.includes?("any")
    puts "\n\n where=[#{where}] \n\n"
    orders = Order.all(where)
    main_text = "ok cnt=[#{orders.size}]"

    # years = {} of String => Hash(String, Order)
    years = {} of String => Hash(String, Hash(String, Hash(Int64, Order)))
    orders.each do |order|
      t : Time = order.add_time || Time.new(0)
      year  : String = t.year.to_s
      month : String = year  + '-' + t.month.to_s
      day   : String = month + '-' + t.day.to_s
      o_id  : Int64 = order.id || Int64.new(0)
      years[year] ||= {} of String => Hash(String, Hash(Int64, Order))
      years[year][month] ||= {} of String => Hash(Int64, Order)
      years[year][month][day] ||= {} of Int64 => Order
      years[year][month][day][o_id] = order
    end
    time_now = Time.now
    years_items = ""
    years.each do |year, monthes|
      y_opened = check_id_opened(year, open_list)
      year_childs = ""
      monthes.each do |month, days|
        m_opened = check_id_opened(month, open_list)
        month_childs = ""
        days.each do |day, orders|
          day_opened = check_id_opened(day, open_list)
          day_childs = ""
          orders.each do |orders_id, order|
            data = { orders_id: orders_id.to_s, number: order.number.to_s }
            day_childs += render(partial: "order_list_row.slang")
          end
      #     data = { order_list_rows: day_childs }
          # day_content = render(partial: "order_list.slang")
          data = { order_list_rows: day_childs }
          day_childs = render(partial: "order_list.slang")  
          data = { id: day, opened: day_opened ? " checked='checked'" : "", content: day_opened ? day_childs : "", stat_items: "", label: day, level: "2", bold_label: "" }
          month_childs += render(partial: "tree_item.slang")
        end
        data = { tree_items: month_childs }
        month_childs = render(partial: "tree.slang")
        data = { id: month, opened: m_opened ? " checked='checked'" : "", content: m_opened ? month_childs : "", stat_items: "", label: month, level: "3", bold_label: "" }
        year_childs += render(partial: "tree_item.slang")
      #   # year_childs += embed("tree_item.slang")
      end
      data = { tree_items: year_childs }
      year_childs = render(partial: "tree.slang")
      data = { id: year, opened: y_opened ? " checked='checked'" : "", content: y_opened ? year_childs : "", stat_items: "", label: year, level: "4", bold_label: "" }
      years_items += render(partial: "tree_item.slang")
    end

    data = { tree_items: years_items }
    main_text += render(partial: "tree.slang")
    # res =  Dummy.new(data).to_json(JSON::Builder.new)
    # json = %({ "result" => 1, "main_text" => "#{data}", "search_time" => 0, "title" => "asdads" })
    # puts "\n\n res=[#{res.inspect}] \n\n";
    # json = JSON.mapping({ version:  "asd" }).to_json
    # json = Dummy.new("zxczc", "asdads").to_json()
    # json = to_json_main_text("wqeqwe", "zxczxcx")
    # parser = JSON::PullParser.new json
    # puts "\n\n json=[#{json.inspect}] \n\n";

    params["form_by_ajax"]? ? to_json_main_text(main_text, "Заказы") : render("index.slang")
  end
  
  def check_id_opened(id : String, list : Array = [] of String)
    (!(list.bsearch { |x| x.starts_with?(id) }.nil?))
  end

  def show
    if order = Order.find params["id"]
      render("show.slang")
    else
      flash["warning"] = "Order with ID #{params["id"]} Not Found"
      redirect_to "/orders"
    end
  end

  def new
    order = Order.new
    render("new.slang")
  end

  def create
    order = Order.new(order_params.validate!)

    if order.valid? && order.save
      flash["success"] = "Created Order successfully."
      redirect_to "/orders"
    else
      flash["danger"] = "Could not create Order!"
      render("new.slang")
    end
  end

  def edit
    if order = Order.find params["id"]
      render("edit.slang")
    else
      flash["warning"] = "Order with ID #{params["id"]} Not Found"
      redirect_to "/orders"
    end
  end

  def update
    if order = Order.find(params["id"])
      order.set_attributes(order_params.validate!)
      if order.valid? && order.save
        flash["success"] = "Updated Order successfully."
        redirect_to "/orders"
      else
        flash["danger"] = "Could not update Order!"
        render("edit.slang")
      end
    else
      flash["warning"] = "Order with ID #{params["id"]} Not Found"
      redirect_to "/orders"
    end
  end

  def destroy
    if order = Order.find params["id"]
      order.destroy
    else
      flash["warning"] = "Order with ID #{params["id"]} Not Found"
    end
    redirect_to "/orders"
  end

  def order_params
    params.validation do
      required(:name) { |f| !f.nil? }
      required(:number) { |f| !f.nil? }
      required(:status) { |f| !f.nil? }
    end
  end
end
