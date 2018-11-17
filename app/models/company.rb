class Company < ApplicationRecord
  acts_as_votable
  has_many :comments, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one :recruit, dependent: :destroy
  has_one :compensation, dependent: :destroy
  
  validates_presence_of :name, :address, :representative_role,
                        :representative_name, :foundation, :business_content,
                        :code_language, :work_time, :work_hour
  mount_uploader :picture, ImageUploader
end
