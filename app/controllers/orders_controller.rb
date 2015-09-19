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
      order = Order.create(
        item_id:  params[:item_id],
        user_id:  params[:user_id],
        quantity: params[:quantity])
      render json: order.to_json
    else
      render json: { err_message: "Record already exists." }, status: 404
    end
  end

  def update
    if Order.exists?(params[:id])
      order = Order.find(params[:id])

      if !params[:item_id].nil?
        order.item_id = params[:item_id]
        order.save
      end

      if !params[:user_id].nil?
        order.user_id = params[:user_id]
        order.save
      end

      if !params[:quantity].nil?
        order.quantity = params[:quantity]
        order.save
      end

      render json: order.to_json, status: 200
    else
      render json: { err_message: "Record not found." }, status: 404
    end
  end

  def destroy
    if Order.exists?(params[:id])
      Order.find(params[:id]).destroy
      render json: { message: "User deleted from database."}, status: 200
    else
      render json: { err_message: "Record not found." }, status: 404
    end
  end
end
