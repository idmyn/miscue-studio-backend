class AddMiscueToMistakes < ActiveRecord::Migration[6.0]
  def change
    add_column :mistakes, :miscue, :string
  end
end
