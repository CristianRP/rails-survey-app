class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.string :name
      t.integer :kind, default: 0
      t.references :section, null: false, foreign_key: true

      t.timestamps
    end
  end
end
