class Book < ApplicationRecord
  belongs_to :customer
  belongs_to :course, optional: true
  belongs_to :usage, optional: true
  belongs_to :tablenumber, optional: true
  accepts_attachments_for :tablenumbers
end
