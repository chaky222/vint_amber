class Admin::OrderController < AdminController
  def index
    # puts "\n\n index \n\n\n"
    managers = User.managers
    manager_list = params["managers"]? ? params["managers"].split(",") : ['0', context.data[:user_id].to_s]
    status_list = params["statuses"]? ? params["statuses"].split(",") : ["any"]
    # puts "\n\n current=[#{Amber.database.inspect}] \n\n"
    period = Utils::Period.by_date_range_str(params["date_range"]?, { default: :plus_minus_5 })
    if !period
      puts "\n\n BAD period=[#{period.inspect}] \n\n"
      main_text = "Неверно указана дата [#{params["date_range"]?}]."
      return params["form_by_ajax"]? ? to_json_main_text(main_text, "Заказы") : render("index.slang")
    end
    # puts "\n\n period=[#{period.inspect}] \n\n"

    open_list = params["open"]? ? params["open"].split(",") : [Time.now.to_s("%Y-%m-%d")]
    where = "WHERE (id IS NOT NULL) AND (add_time #{period.to_sql})"
    where += " AND (manager_id IN (#{ manager_list.map { |x| x.to_i.to_s }.join(",") }))" unless manager_list.includes?("any")
    where += " AND (status IN (#{ status_list.map { |x| x.to_i.to_s }.join(",") }))" unless status_list.includes?("any")
    # where += " LIMIT 5"
    # puts "\n\n where=[#{where}] \n\n"
    # orders = Order.all(where)
    # orders_prods = OrderProduct.all("WHERE order_id IN (SELECT id FROM orders "+ where + ")")
    orders = Order.with_prods(where)
    main_text = "<span style='font-weight: normal;'>За период ( #{ period.to_s } ) (#{ period.days } дней) найдено #{ orders.size } заказов</span>"

    # years = {} of String => Hash(String, Order)
    years = {} of String => Hash(String, Hash(String, Hash(Int64, Order)))
    orders.each do |order|
      t : Time = order.add_time || Time.new(0)
      year  : String = t.year.to_s
      month : String = year  + '-' + (t.month > 9 ? "" : '0') + t.month.to_s
      day   : String = month + '-' + (t.day   > 9 ? "" : '0') + t.day.to_s
      o_id  : Int64 = order.id || Int64.new(0)
      years[year] ||= {} of String => Hash(String, Hash(Int64, Order))
      years[year][month] ||= {} of String => Hash(Int64, Order)
      years[year][month][day] ||= {} of Int64 => Order
      years[year][month][day][o_id] = order
    end
    time = Time.now
    time_now = time.to_s("%Y-%m-%d")
    years_items = ""
    years.keys.sort.reverse_each do |year|
      monthes = years[year]
      y_opened = check_id_opened(year, open_list)
      year_childs = ""
      monthes.keys.sort.reverse_each do |month|
        days = monthes[month]
        m_opened = check_id_opened(month, open_list)
        month_childs = ""
        days.keys.sort.reverse_each do |day_label|
          day_orders = days[day_label]
          day_opened = check_id_opened(day_label, open_list)
          day_childs = ""
          day_orders.values.sort do |a, b| (
            # (((b.manager_id || 0) == 0 ? 1 : 0) <=> ((a.manager_id || 0) == 0 ? 1 : 0)) * 131072 +
            (((b.important || 0) <=> (a.important || 0)) * 32768) +
            (((b.call_waiting || 0) <=> (a.call_waiting || 0)) * 8192) +
            ((Order::ORDER_STATUSES[a.status][:p] <=> Order::ORDER_STATUSES[b.status][:p]) * 64) +
            ((User.get_name(a.manager_id).compare(User.get_name(b.manager_id))) * 8) +
            ((b.id || 0) <=> (a.id || 0)) ).to_i32
          end.each do |order|
            delivery_accept : String = ""
            if Utils.arr_i8([1, 12]).includes?(order.status)
              if (order.delivery_accept || 0) > 0
                delivery_accept = "<b style=\"color:blue;\">принят</b>"
              else
                delivery_accept = "<span style=\"color:red;\">рассматривается</span>"
                unless order.delivery_submit.nil?
                  minuts : Int64 = ((Time.now - (order.delivery_submit || Time.now)).total_seconds / 60).trunc.to_i64
                  delivery_accept = "<b style=\"color:red;\">рассматривается</b>" if (minuts > 30)
                  delivery_accept = "<blink>#{delivery_accept}</blink>" if (minuts > 60)
                end
              end
            end
            # delivery_accept += "<br>\n i=[#{order.important}] c=[#{order.call_waiting}] st=[#{order.status}] <br>\n"
            order_prio : Bool = Utils.arr_i8([1, 12, 2, 4, 3]).includes?(order.status)
            sklads = order.get_sklads_sum.keys.size.to_s + ". " + order.get_sklads_sum.map do |k, v|
              sklad_name = order_prio ? "<a href='#' onclick=\"wopen('/cgi-bin/admin/a_vendors.cgi?do=edit_vendor&id=#{k}')\">#{Vendor.get_name(k)}</a>" : Vendor.get_name(k)
              sklad_name + '-' + v.to_s
            end.join(' ')
            # star_in_hour = false
            star_in_hour : Bool = (time + 1.hours) > ((order.add_time || time).date + (order.time_to || 0).to_i32.hours)
            star : String = "<img style='margin-right: -7px; height:16px;' time='#{((order.add_time || time).date + (order.time_to || 0).to_i32.hours).to_s}' time_to='#{(order.time_to || 0).to_i32.hours.to_s}' src='/img/#{ star_in_hour ? "star_sm.gif" : "star_red.png" }'/>&nbsp;&nbsp;"
            star += "<img style='margin-right: -7px; height:16px;' src='/img/call_waiting_color.png'/>&nbsp;&nbsp;" if (order.call_waiting || 0) > 0;
            # star += "<img style='margin-right: -7px; height:16px;' src='/img/recall_need.png'/>&nbsp;&nbsp;" if (order.last_orders_quality_mark || 0) > 0;
            # sklads = sklads_arr.join(' ')
            new_order : Bool = (order.manager_id || 0) > 0 ? false : true
            manager_name = ((order.manager_id || 0) > 0) ? User.get_name(order.manager_id) : "<a href='#' onclick='ajax_change_manager_lite(#{ order.id });'><b>Забрать</b></a>"
            order_name = new_order ? "Новый заказ (#{ (order.add_time || time).to_s("%H:%M") })" : "<a href='/cgi-bin/admin/a_orders_new.cgi?do=show_order&order_id=#{order.id.to_s}'>#{ order.name }</a>"
            data = { delivery_accept: delivery_accept,
                     manager_name: manager_name,
                     prod_cnt: new_order ? "" : order.prods.size.to_s,
                     sklads: new_order || order.get_sklads_sum.keys.size == 0 ? "" : sklads,
                     star: (order.important || 0) > 0 ? star : "",
                     order_name: order_prio ? "<b>#{ order_name }</b>" : order_name,
                     k_status_color: (order.k_status || 0) == 4 && (order.status || 0) == 100 ? "orange" : "" }
            day_childs += render(partial: "order_list_row.slang")
            # return "ok"
          end
      #     data = { order_list_rows: day_childs }
          # day_content = render(partial: "order_list.slang")
          data = { order_list_rows: day_childs }
          day_childs = render(partial: "order_list.slang")  
          data = { id: day_label, opened: day_opened ? " checked='checked'" : "", content: day_opened ? day_childs : "", stat_items: "", label: day_label, level: "2", bold_label: time_now.starts_with?(day_label) ? "bold_label" : "" }
          month_childs += render(partial: "tree_item.slang")
        end
        data = { tree_items: month_childs }
        month_childs = render(partial: "tree.slang")
        data = { id: month, opened: m_opened ? " checked='checked'" : "", content: m_opened ? month_childs : "", stat_items: "", label: month, level: "3", bold_label: time_now.starts_with?(month) ? "bold_label" : "" }
        year_childs += render(partial: "tree_item.slang")
      #   # year_childs += embed("tree_item.slang")
      end
      data = { tree_items: year_childs }
      year_childs = render(partial: "tree.slang")
      data = { id: year, opened: y_opened ? " checked='checked'" : "", content: y_opened ? year_childs : "", stat_items: "", label: year, level: "4", bold_label: time_now.starts_with?(year) ? "bold_label" : "" }
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
    (!(list.find { |x| x.starts_with?(id) }.nil?))
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
