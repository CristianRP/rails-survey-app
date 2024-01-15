class Survey < ApplicationRecord
  belongs_to :user
  has_many :survey_sections
  has_many :sections, through: :survey_sections

  has_one_attached :avatar, dependent: :destroy
end
