class Review < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_many :comments, dependent: :destroy

  scope :star, (lambda do |star| where("rating = ?", star) end)
end