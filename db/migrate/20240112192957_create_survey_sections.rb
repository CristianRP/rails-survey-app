class CreateSurveySections < ActiveRecord::Migration[7.1]
  def change
    create_table :survey_sections do |t|
      t.references :survey, null: false, foreign_key: true
      t.references :section, null: false, foreign_key: true
      t.integer :order, default: 0

      t.timestamps
    end
  end
end
