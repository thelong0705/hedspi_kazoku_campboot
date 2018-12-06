class Comment < ApplicationRecord
  belongs_to :review
  belongs_to :user
  has_many :replies, dependent: :delete_all
end


