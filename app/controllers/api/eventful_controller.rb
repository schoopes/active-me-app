class Api::EventfulController < ApplicationController

  before_action :authenticate_user

  def index
    location = current_user.location.gsub(/\s+/,"%20")

    response = HTTP.get("https://api.eventful.com/json/events/search?app_key=#{ENV["APP_KEY"]}&location=#{location}&keywords=volunteer")
    parsed_response = JSON.parse(response)
    @events = parsed_response["events"]["event"]

    render 'index.json.jbuilder'
    
  end

end
