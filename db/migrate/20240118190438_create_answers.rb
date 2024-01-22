class CreateAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :answers do |t|
      t.string :name
      t.references :question, null: false, foreign_key: true
      t.string :user_token

      t.timestamps
    end
  end
end
