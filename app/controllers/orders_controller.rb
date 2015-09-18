class OrdersController < ApplicationController
  def index
    orders = Order.all
    render json: orders.to_json
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end
end
