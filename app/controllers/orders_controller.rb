class OrdersController < ApplicationController
  def index
    orders = Order.all
    render json: orders.to_json
  end

  def show
    if Order.exists?(params[:id])
      orders = Order.find(params[:id])
      render json: orders.to_json, status: 200
    else
      render json: { err_message: "Record not found." }, status: 404
    end
  end

  def create
    if !(Order.exists?(params[:id]))
      order = Order.new(
        item_id:  params[:item_id],
        user_id:  params[:user_id],
        quantity: params[:quantity])
      render json: order.to_json
    else
      render json: { err_message: "Record already exists." }, status: 404
    end
  end

  def update
  end

  def destroy
  end
end
