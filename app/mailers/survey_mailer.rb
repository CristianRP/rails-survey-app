class SurveyMailer < ApplicationMailer
  def welcome
    @email = params[:email]
    mail(to: @email, subject: 'Welcome')
  end
end
