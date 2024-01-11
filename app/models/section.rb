class Section < ApplicationRecord
  belongs_to :user
  has_many :questions, dependent: :destroy

  enum kind: {
    default: 0,
    evaluation: 1,
    chapter: 2
  }
end
