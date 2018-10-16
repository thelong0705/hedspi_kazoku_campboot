class Company < ApplicationRecord
	validates :name, presence: true
	validates :address, presence: true
	validates :representative_name, presence: true
	validates :representative_role, presence: true
	validates :foundation, presence: true
	validates :business_content, presence: true
	validates :code_language, presence: true
	validates :work_time, presence: true
	validates :work_hour, presence: true

	mount_uploader :picture, ImageUploader
end
