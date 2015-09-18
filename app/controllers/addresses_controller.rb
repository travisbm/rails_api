class AddressesController < ApplicationController
  def index
    addresses = Address.all
    render json: addresses.to_json
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
