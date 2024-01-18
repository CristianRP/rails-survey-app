class SurveyMailer < ApplicationMailer
  def welcome
    subject = params[:subject]
    @message = params[:message]
    @email = params[:email]
    @survey = params[:survey]
    @url = "http://192.168.0.19:3000/audits/#{@survey.uuid}"
    mail(to: @email, subject: subject)
  end
end
