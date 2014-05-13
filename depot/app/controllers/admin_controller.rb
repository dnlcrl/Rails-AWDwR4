class AdminController < ApplicationController
  def index
    @totsl_orders = Order.count
  end
end
