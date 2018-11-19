class Review < ApplicationRecord
  belongs_to :user
  belongs_to :company

  scope :star, (lambda do |star| where("rating = ?", star) end)
end