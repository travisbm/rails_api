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
  end

  def update
  end

  def destroy
  end
end
