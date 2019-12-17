class Mistake < ApplicationRecord
  belongs_to :reading
  belongs_to :story_word
  delegate :word, to: :story_word
end
