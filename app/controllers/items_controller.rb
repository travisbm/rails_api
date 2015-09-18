class ItemsController < ApplicationController
  def index
    items = Item.all
    render json: items.to_json
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
