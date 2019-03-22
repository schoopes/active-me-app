class Api::SendgridController < ApplicationController
  require 'sendgrid-ruby'
  include SendGrid

  before_action :authenticate_user

  def test
    from = Email.new(email: 'test@example.com')
    to = Email.new(email: 'test@example.com')
    subject = 'Sending with SendGrid is Fun'
    content = Content.new(type: 'text/plain', value: 'and easy to do anywhere, even with Ruby')
    mail = Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['SG_API_KEY'])
    @response = sg.client.mail._('send').post(request_body: mail.to_json)

    render 'test.json.jbuilder'
  end

  def confirmation
    from = Email.new(email: 'schoopes@gmail.com')
    to = Email.new(email: current_user.email)
    subject = 'Please confirm your email with ActiveMe'
    link = link_to("http://localhost:8080/sendgrid/confirmation")
    content = Content.new(type: 'text/plain', value: "Hi, #{current_user.first_name}! Congratulations for setting up an account with ActiveMe. Please click this link to confirm your email address and finish setting up your account.")
    mail = Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['SG_API_KEY'])
    @response = sg.client.mail._('send').post(request_body: mail.to_json)

    render json: {message: "Email sent!"}
  end

end
