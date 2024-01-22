class AddSurveyToAnswer < ActiveRecord::Migration[7.1]
  def change
    add_reference(:answers, :survey, foreign_key: true, null: false)
  end
end
