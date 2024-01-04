class ChangeDataTypeToKindInSection < ActiveRecord::Migration[7.1]
  def up
    change_column :sections, :kind, :integer, using: 'kind::integer', default: 0
  end

  def down
    change_column :sections, :kind, :string
  end
end
