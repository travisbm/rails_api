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
    if !(Address.exists?(params[:id]))
      address = Address.new(
        user_id:     params[:user_id],
        street_name: params[:street_name],
        city:        params[:city],
        state:       params[:state],
        zip:         params[:zip])
      render json: address.to_json
    else
      render json: { err_message: "Record already exists." }, status: 404
    end
  end

  def update
  end

  def destroy
  end
end
