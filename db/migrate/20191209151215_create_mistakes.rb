class CreateMistakes < ActiveRecord::Migration[6.0]
  def change
    create_table :mistakes do |t|
      t.string :type
      t.references :reading, null: false, foreign_key: true
      t.references :story_word, null: false, foreign_key: true

      t.timestamps
    end
  end
end
