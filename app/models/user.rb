class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable 
  validates :email, :password, :name, :company, :gender, :password_confirmation, presence: true
  validates :school_year, inclusion: { in: 1..5 }
end
