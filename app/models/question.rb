class Question < ApplicationRecord
  # TODO: check if question, would be used for another kind of section, if not just add :evaluation
  belongs_to :section
  belongs_to :evaluation, foreign_key: :section_id
  has_many :options, dependent: :destroy
  has_one :answer

  default_scope -> { order(id: :asc) }

  broadcasts_to :evaluation
  after_commit :send_partial_counter, on: %i(create destroy)

  enum kind: {
    default: 0,
    text_free: 1,
    multiple: 2,
    level: 3
  }

private

  def send_partial_counter
    broadcast_replace_to(evaluation, target: 'count', partial: 'questions/count', locals: { list: self.evaluation.questions })
  end
end
