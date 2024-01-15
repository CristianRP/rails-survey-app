class SurveySection < ApplicationRecord
  belongs_to :survey
  belongs_to :section

  validates :survey_id, uniqueness: { scope: :section_id }
end
