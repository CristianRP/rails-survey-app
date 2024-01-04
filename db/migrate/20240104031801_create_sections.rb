class CreateSections < ActiveRecord::Migration[7.1]
  def up
    create_table :sections do |t|
      t.string :name
      t.string :description
      t.string :type
      t.text :body
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :sections
  end
end
