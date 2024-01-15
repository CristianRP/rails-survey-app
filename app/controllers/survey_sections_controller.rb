class SurveySectionsController < ApplicationController
  before_action :set_survey, only: %i(new create destroy)
  before_action :set_section, only: :destroy
  before_action :set_survey_section, only: :destroy

  def new; end

  def create
    section_ids = params[:sections][:ids].compact_blank.map(&:to_i)
    new_section_ids = section_ids - @survey.section_ids

    return if new_section_ids.empty?

    @new_sections = Section.where(id: new_section_ids)
    @survey.sections << @new_sections

    respond_to do |format|
      if @survey.save
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @section_section.destroy
  end

private

  def set_survey
    @survey = Survey.find_by(id: params[:survey_id])
  end

  def set_survey_section
    @section_section = SurveySection.where(survey_id: params[:survey_id], section_id: params[:id]).first
  end

  def set_section
    @section = Section.find_by(id: params[:id])
  end
end
