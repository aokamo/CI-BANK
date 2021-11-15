class Course < ApplicationRecord
  has_many :book_courses
  has_many :books, through: :book_courses
  validates :name, presence: true
end
