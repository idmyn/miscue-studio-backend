class Teacher < ApplicationRecord
  has_secure_password
  has_many :students

  validates :email, presence: true, uniqueness: true, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }
  # https://emailregex.com/
end
