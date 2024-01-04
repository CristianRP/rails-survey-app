class RenameTypeToKindInSection < ActiveRecord::Migration[7.1]
  def change
    rename_column :sections, :type, :kind
  end
end
