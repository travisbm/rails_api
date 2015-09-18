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
      item = Item.new(
        name:        params[:name],
        price:       params[:price],
        description: params[:description])
      render json: item.to_json
    else
      render json: { err_message: "Record already exists." }, status: 404
    end
  end

  def update
  end

  def destroy
  end
end
