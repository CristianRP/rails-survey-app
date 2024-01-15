class Section < ApplicationRecord
  belongs_to :user
  has_many :questions, dependent: :destroy
  has_many :survey_sections
  has_many :surveys, through: :survey_sections

  scope :not_in_survey, lambda { |survey_id|
                          where.not(id: joins(:survey_sections).where(
                            survey_sections: { survey_id: survey_id }
                          ))
                        }

  enum kind: {
    default: 0,
    evaluation: 1,
    chapter: 2
  }
end
