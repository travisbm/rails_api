class UsersController < ApplicationController
  def index
    users = User.all
    render json: users.to_json
  end

  def show
    if User.exists?(params[:id])
      user = User.find(params[:id])
      render json: user.to_json, status: 200
    else
      render json: { err_message: "Record not found." }, status: 404
    end
  end

  def create
    if !(User.exists?(params[:id]))
      user = User.create(
        first_name: params[:first_name],
        last_name:  params[:last_name],
        age:        params[:age])
      render json: user.to_json
    else
      render json: { err_message: "Record already exists." }, status: 404
    end
  end

  def update
    if User.exists?(params[:id])
      user = User.find(params[:id])

      if !params[:first_name].nil?
        user.first_name = params[:first_name]
        user.save
      end

      if !params[:last_name].nil?
        user.last_name = params[:last_name]
        user.save
      end

      if !params[:age].nil?
        user.age = params[:age]
        user.save
      end

      render json: user.to_json, status: 200
    else
      render json: { err_message: "Record not found." }, status: 404
    end
  end

  def destroy
    if User.exists?(params[:id])
      user = User.find(params[:id])
      user.destroy
      render json: { message: "User deleted from database."}, status: 200
    else
      render json: { err_message: "Record not found." }, status: 404
    end
  end
end
