class Course < ApplicationRecord
  has_many :book_courses
  validates :name, presence: true
end
