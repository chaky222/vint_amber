class OrderController < ApplicationController
  def index
    orders = Order.all
    render("index.slang")
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
