class Book < ApplicationRecord
  has_many :customer_books
  has_many :customers, through: :customer_books
  has_many :book_courses
  has_many :courses, through: :book_courses
  has_many :book_usages
  has_many :usages, through: :book_usages
end
