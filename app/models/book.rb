class Book < ApplicationRecord
  belongs_to :customer
  has_many :course
  has_many :usage
end
