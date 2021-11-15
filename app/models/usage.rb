class Usage < ApplicationRecord
  has_many :book_usages
  has_many :books, through: :book_usages
  validates :name, presence: true
end
