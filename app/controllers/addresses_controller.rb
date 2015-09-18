class AddressesController < ApplicationController
  def index
    addresses = Address.all
    render json: addresses.to_json
  end

  def show
    if Address.exists?(params[:id])
      address = Address.find(params[:id])
      render json: address.to_json, status: 200
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
