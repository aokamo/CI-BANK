class BookCourse < ApplicationRecord
  belongs_to :book, optional: true
  belongs_to :course, optional: true
end
