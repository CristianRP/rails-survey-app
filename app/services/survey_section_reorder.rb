class SurveySectionReorder
  def initialize(survey_section)
    @survey_section = survey_section
    @surve = survey_section.survey
  end

  def perform(operation)
    if operation == 'up'
      reorder_up
    else
      reorder_down
    end
  end

private

  def reorder_up
    previous_survey_section = @survey_section.previous_survey_section
    section_params = { order: @survey_section.order - 1 }
    previous_survey_section_params = { order: previous_survey_section.order + 1 }

    { section_to_replace: previous_survey_section, section_params: section_params,
      section_to_replace_params: previous_survey_section_params }
  end

  def reorder_down
    next_survey_section = @survey_section.next_survey_section
    section_params = { order: @survey_section.order + 1 }
    next_survey_section_params = { order: next_survey_section.order - 1 }

    { section_to_replace: next_survey_section, section_params: section_params,
      section_to_replace_params: next_survey_section_params }
  end
end
