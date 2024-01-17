class AddUuuiToSurveys < ActiveRecord::Migration[7.1]
  def change
    add_column :surveys, :uuid, :string
  end
end
