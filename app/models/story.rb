class Story < ApplicationRecord
  has_many :story_words
  has_many :readings
  has_many :students, through: :readings

  def content
    sorted = story_words.sort { |a, b| a.index <=> b.index }.map(&:content)
    sorted.join(" ")
  end
end
