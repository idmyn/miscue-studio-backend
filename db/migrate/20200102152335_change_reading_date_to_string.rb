class ChangeReadingDateToString < ActiveRecord::Migration[6.0]
  def change
    change_column :readings, :date, :string
  end
end
