require 'csv'

class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :survey

  def self.to_csv
    answers = all

    CSV.generate do |csv|
      csv << %w(Section Question Answer User)

      answers.each do |answer|
        csv << [
          answer.question.section.name,
          answer.question.name,
          answer.question.text_free? ? answer.name : Option.find(answer.name.to_i).name.to_plain_text,
          answer.user_token
        ]
      end
    end
  end
end
