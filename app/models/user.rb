class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :replies
  has_many :messages
  has_many :conversations, foreign_key: :sender_id
  acts_as_voter
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
  validates_presence_of :gender, :name, :school
  validates :school_year, inclusion: {in: 1..5}

  mount_uploader :picture, ImageUploader
end
