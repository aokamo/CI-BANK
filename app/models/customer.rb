class Customer < ApplicationRecord
  has_many :customer_books
  has_many :books, through: :customer_books

  def self.search(keyword)
    where(["name like? OR phone_num like?", "%#{keyword}%", "%#{keyword}%"])
  end
end
