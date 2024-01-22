class AuditsController < ApplicationController
  layout 'audits'

  before_action :set_survey, only: %i(index save_answers)

  def index
    @token = params[:token]
    @step = params[:step].to_i
    @total = @survey.sections.size
  end

  def save_answers
    ids = params[:question][:ids]
    ids.each do |key, value|
      next if value.blank?

      answer = Answer.find_or_create_by(question_id: key, user_token: params[:user_token], survey_id: @survey.id)

      answer.update(name: value)
    end
  end

  def finish
    @survey = Survey.find_by(id: params[:id])
  end

private

  def set_survey
    @survey = Survey.find_by(uuid: params[:uuid])
    redirect_to root_path if @survey.nil?
  end
end
