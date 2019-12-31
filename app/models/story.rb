class Story < ApplicationRecord
  has_many :story_words
  has_many :readings
  has_many :students, through: :readings
  has_many :words, through: :story_words

  def content
    story_words.map(&:content)
  end
end
