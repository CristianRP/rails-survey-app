class SurveysController < ApplicationController
  before_action :set_survey, only: %i(show edit update destroy deliver add_emails)

  # GET /surveys or /surveys.json
  def index
    @surveys = Survey.all
  end

  # GET /surveys/1 or /surveys/1.json
  def show; end

  # GET /surveys/new
  def new
    @survey = Survey.new
  end

  # GET /surveys/1/edit
  def edit; end

  # POST /surveys or /surveys.json
  def create
    @survey = current_user.surveys.build(survey_params)

    respond_to do |format|
      if @survey.save
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /surveys/1 or /surveys/1.json
  def update
    respond_to do |format|
      if @survey.update(survey_params)
        format.turbo_stream
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1 or /surveys/1.json
  def destroy
    @survey.destroy!

    respond_to do |format|
      format.html { redirect_to surveys_url, notice: 'Survey was successfully destroyed.' }
    end
  end

  def deliver
    SurveyMailer.with(
      email: deliver_survey_params[:send_to],
      subject: deliver_survey_params[:subject],
      message: deliver_survey_params[:message],
      survey: @survey
    ).welcome.deliver_later
  end

  def add_emails
  end

private

  def set_survey
    @survey = Survey.find(params[:id] || params[:survey_id])
  end

  def survey_params
    params.require(:survey).permit(:name, :description, :avatar)
  end

  def deliver_survey_params
    { send_to: params[:send_to], subject: params[:subject], message: params[:message] }
  end
end
