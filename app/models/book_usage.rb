class BookUsage < ApplicationRecord
  belongs_to :book, optional: true
  belongs_to :usage, optional: true
end
