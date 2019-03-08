class Api::GoogleController < ApplicationController

  def google_authorize
    redirect_to "https://accounts.google.com/o/oauth2/auth?scope=https://www.googleapis.com/auth/calendar&redirect_uri=http://localhost:3000/api/google/callback&response_type=code&client_id=172210505146-cglcauiuv08b1rae1pe7a4o4psobdgr6.apps.googleusercontent.com"
  end

  def google_callback
    auth_code = params[:code]
    response = HTTP.post("https://www.googleapis.com/oauth2/v4/token",
      form: {
        grant_type: "authorization_code",
        code: auth_code,
        redirect_uri: "http://localhost:3000/api/google/callback",
        client_id: "172210505146-cglcauiuv08b1rae1pe7a4o4psobdgr6.apps.googleusercontent.com",
        client_secret: ENV["CLIENT_SECRET"]
      })
    access_token = response.parse["access_token"]
    response = HTTP.auth("Bearer #{access_token}").get("https://www.googleapis.com/calendar/v3/users/me/calendarList")
    render json: response.parse

  end

end
