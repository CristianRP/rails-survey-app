class SurveyMailer < ApplicationMailer
  def welcome
    subject = params[:subject]
    @message = params[:message]
    @log = params[:log]
    @survey = params[:survey]
    @url = "http://192.168.0.19:3000/audits/#{@survey.uuid}/#{@log.token}/0"
    mail(to: @log.email, subject: subject)
  end
end
