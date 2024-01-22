class Survey < ApplicationRecord
  belongs_to :user
  has_many :survey_sections
  has_many :sections, through: :survey_sections
  has_many :answers, dependent: :destroy
  has_many :survey_logs, dependent: :destroy

  has_one_attached :avatar, dependent: :destroy

  before_create :set_uuid

private

  def set_uuid
    self.uuid = SecureRandom.uuid
  end
end
