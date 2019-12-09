class Student < ApplicationRecord
  belongs_to :teacher
  has_many :readings
  has_many :stories, through: :readings
  # has_many :words, through: :readings
  # has_many :mistakes, through: :readings
end
