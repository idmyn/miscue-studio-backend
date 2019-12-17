class RenameMistakeTypeToCategory < ActiveRecord::Migration[6.0]
  def change
    rename_column :mistakes, :type, :category
  end
end
