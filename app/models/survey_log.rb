class SurveyLog < ApplicationRecord
  has_secure_token :token, length: 50

  belongs_to :survey
end
