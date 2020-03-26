class PlaceMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(places_json)
    @places_json = places_json
    # @user = params[:user]
    mail(to: "ayarem21@gmail.com", subject: 'Result')
  end
end
