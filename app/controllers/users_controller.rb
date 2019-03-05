class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @users = User.all
  end

  def create
    @user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      location: params[:location],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    @user.save
    redirect_to "/users/#{@product.id}"
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.first_name = params[:first_name] || @user.first_name
    @user.last_name = params[:last_name] || @user.last_name
    @user.email = params[:email] || @user.email
    @user.location = params[:location] || @user.location
    @user.password = params[:password] || @user.password

    @user.save
    redirect to "/users/#{@user.id}"
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect to "/users/new"
  end

end
