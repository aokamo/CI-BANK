class CustomerBook < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to :book, optional: true
end
