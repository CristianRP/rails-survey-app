# Preview all emails at http://localhost:3000/rails/mailers/survey_mailer
class SurveyMailerPreview < ActionMailer::Preview
  def welcome
    SurveyMailer.with(email: 'cristianramirezgt@gmail.com').welcome
  end
end
