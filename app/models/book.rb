class Book < ApplicationRecord
  belongs_to :customer
  has_many :courses
  has_many :usages
  has_many :tablenumbers
end
