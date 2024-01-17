class SurveySectionsController < ApplicationController
  before_action :set_survey
  before_action :set_section, only:  %i(destroy update)
  before_action :set_survey_section, only: %i(destroy update create)
  before_action :set_positions, only: %i(update create)

  def new; end

  def create
    section_ids = params[:sections][:ids].compact_blank.map(&:to_i)
    new_section_ids = section_ids - @survey.section_ids

    return if new_section_ids.empty?

    survey_sections = @survey.sections.order(order: :asc)
    @last_section = survey_sections.last
    @size = survey_sections.count
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

  def update
    service = SurveySectionReorder.new(@survey_section)
    replace_params = service.perform(params[:operation])

    @section_to_replace = replace_params[:section_to_replace]

    respond_to do |format|
      if @survey_section.update(replace_params[:section_params]) && @section_to_replace.update(replace_params[:section_to_replace_params])
        format.turbo_stream
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @survey_section.destroy
    SurveySection.order_sections(@survey.id)
  end

private

  def set_survey
    @survey = Survey.find_by(id: params[:survey_id])
  end

  def set_survey_section
    @survey_section = SurveySection.where(survey_id: params[:survey_id],
                                          section_id: params[:id]).first
  end

  def set_section
    @section = Section.find_by(id: params[:id])
  end

  def set_positions
    @index = params[:index].to_i
    @index_to_replace = params[:operation] == 'up' ? params[:index].to_i - 1 : params[:index].to_i + 1
    @size = params[:size].to_i
  end
end
