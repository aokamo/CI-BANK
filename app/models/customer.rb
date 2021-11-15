class Customer < ApplicationRecord
  has_many :books

  def self.search(keyword)
    where(["name like? OR phone_num like?", "%#{keyword}%", "%#{keyword}%"])
  end
end
