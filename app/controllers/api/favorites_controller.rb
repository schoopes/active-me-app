class Api::FavoritesController < ApplicationController

  before_action :authenticate_user, only: [:index, :create, :destroy]

  def attendees
    @attendees = 0
    favorites = Favorite.where(eventful_id: params[:eventful_id])
    favorites.each do
      @attendees = @attendees + 1
    end

    render 'attendees.json.jbuilder'
  end

  def index
    favorites = current_user.favorites
    @favorites = []

    favorites.each do |favorite|
      response = HTTP.get("http://api.eventful.com/json/events/get?app_key=#{ENV["APP_KEY"]}&id=#{favorite.eventful_id}")
      favorite = JSON.parse(response)
      @favorites.push(favorite)
    end

    render 'index.json.jbuilder'

  end

  def create
    @favorite = Favorite.new(
      user_id: params[:user_id],
      eventful_id: params[:eventful_id]
      )
    @favorite.save
    render json: {message: "Favorite successfully created."}
  end

  def destroy
    @favorite = Favorite.find_by(eventful_id: params[:eventful_id])
    @favorite.destroy
    render json: {message: "Favorite has successfully been deleted."}
  end

end
