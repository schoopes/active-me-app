class Api::FavoritesController < ApplicationController

  before_action :authenticate_user

  def index
    favorites = current_user.favorites
    @favorites = []

    favorites.each do |favorite|
      response = HTTP.get("http://api.eventful.com/json/events/get?app_key=#{ENV["APP_KEY"]}&id=#{favorite.eventful_id}")
      favorite = JSON.parse(response)
      @favorites << favorite
    end

    render 'index.json.jbuilder'

  end

  def create
    @favorite = Favorite.new(
      user_id: params[:user_id],
      eventful_id: params[:eventful_id]
      )
    @favorite.save
    render json: {message: "Favorite created"}

  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    render json: {message: "Favorite has successfully been deleted."}
  end

end
