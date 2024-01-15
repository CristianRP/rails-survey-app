class SurveySectionsController < ApplicationController
  before_action :set_survey, only: %i(new create)

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

private

  def set_survey
    @survey = Survey.find_by(id: params[:survey_id])
  end
end
