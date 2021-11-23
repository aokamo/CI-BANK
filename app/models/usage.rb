class Usage < ApplicationRecord
  has_many :books
  validates :name, presence: true
end
