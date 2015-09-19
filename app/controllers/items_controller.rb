class ItemsController < ApplicationController
  def index
    items = Item.all
    render json: items.to_json
  end

  def show
    if Item.exists?(params[:id])
      item = Item.find(params[:id])
      render json: item.to_json, status: 200
    else
      render json: { err_message: "Record not found." }, status: 404
    end
  end

  def create
    if !(Item.exists?(params[:id]))
      item = Item.create(
        name:        params[:name],
        price:       params[:price],
        description: params[:description])
      render json: item.to_json
    else
      render json: { err_message: "Record already exists." }, status: 404
    end
  end

  def update
    if Item.exists?(params[:id])
      item = Item.find(params[:id])

      if !params[:name].nil?
        item.name = params[:name]
        item.save
      end

      if !params[:price].nil?
        item.price = params[:price]
        item.save
      end

      if !params[:description].nil?
        item.description = params[:description]
        item.save
      end

      render json: item.to_json, status: 200
    else
      render json: { err_message: "Record not found." }, status: 404
    end
  end

  def destroy
    if Item.exists?(params[:id])
      Item.find(params[:id]).destroy
      render json: { message: "User deleted from database."}, status: 200
    else
      render json: { err_message: "Record not found." }, status: 404
    end
  end
end
