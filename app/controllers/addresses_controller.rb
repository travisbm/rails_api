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
      address = Address.create(
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
    if User.exists?(params[:id])
      address = Address.where("user_id = ?", params[:id]).first

      if !params[:street_name].nil?
        address.street_name = params[:street_name]
        address.save
      end

      if !params[:city].nil?
        address.city = params[:city]
        address.save
      end

      if !params[:state].nil?
        address.state = params[:state]
        address.save
      end

      if !params[:zip].nil?
        address.zip = params[:zip]
        address.save
      end

      render json: address.to_json, status: 200
    else
      render json: { err_message: "Record not found." }, status: 404
    end
  end

  def destroy
    if User.exists?(params[:id])
      Address.where("user_id = ?", params[:id]).first.destroy
      render json: { message: "User deleted from database."}, status: 200
    else
      render json: { err_message: "Record not found." }, status: 404
    end
  end
end
