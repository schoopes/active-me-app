class Api::UsersController < ApplicationController

  before_action :authenticate_user, except: :create

  def profile
    @user = current_user
    render 'show.json.jbuilder'
  end

  def show
    @user = User.find(params[:id])
    render 'show.json.jbuilder'
  end

  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      location: params[:location].strip,
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )

    if user.save
      render json: {message: 'User created successfully'}, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end

  end

  def update
    @user = current_user
    @user.first_name = params[:first_name] || @user.first_name
    @user.last_name = params[:last_name] || @user.last_name
    @user.email = params[:email] || @user.email
    @user.location = params[:location] || @user.location
    @user.password = params[:password] || @user.password

    if @user.save
      render 'show.json.jbuilder', status: :created
    else
      render json: {errors: @user.errors.full_messages}, status: :bad_request
    end

  end

  def destroy
    @user = current_user
    @user.destroy
    render json: {message: "User deleted."}
  end

end
