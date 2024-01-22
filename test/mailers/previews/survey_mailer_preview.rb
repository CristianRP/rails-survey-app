# Preview all emails at http://localhost:3000/rails/mailers/survey_mailer
class SurveyMailerPreview < ActionMailer::Preview
  def welcome
    log = SurveyLog.create(email: 'cristianramirezgt@gmail.com', status: 0, survey_id: Survey.first.id)
    SurveyMailer.with(log: log, subject: 'Test', survey: Survey.first).welcome
  end
end
