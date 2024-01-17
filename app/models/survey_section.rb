class SurveySection < ApplicationRecord
  belongs_to :survey
  belongs_to :section

  validates :survey_id, uniqueness: { scope: :section_id }

  before_create :set_order

  default_scope { order(order: :asc) }


  def self.order_sections(survey_id)
    sections = where(survey_id: survey_id).order(order: :asc)

    sections.each.with_index do |section, index|
      section.update!(order: index + 1)
    end
  end

  def previous_survey_section
    survey.survey_sections.find_by(order: order - 1)
  end

  def next_survey_section
    survey.survey_sections.find_by(order: order + 1)
  end

private

  def set_order
    order_sections = SurveySection.where(survey_id: survey_id).order(order: :asc)
    self.order = order_sections.last&.order.to_i + 1
  end
end
