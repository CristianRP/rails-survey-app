class Question < ApplicationRecord
  belongs_to :section

  enum kind: {
    default: 0,
    text_free: 1,
    multiple: 2,
    level: 3
  }
end
