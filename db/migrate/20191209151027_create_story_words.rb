class CreateStoryWords < ActiveRecord::Migration[6.0]
  def change
    create_table :story_words do |t|
      t.references :story, null: false, foreign_key: true
      t.references :word, null: false, foreign_key: true
      t.integer :index
      t.string :content

      t.timestamps
    end
  end
end
