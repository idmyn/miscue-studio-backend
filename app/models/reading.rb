class Reading < ApplicationRecord
  belongs_to :teacher
  belongs_to :student
  belongs_to :story
end
