class Company < ApplicationRecord
  validates_presence_of :name, :address, :representative_role,
                        :representative_name, :foundation, :business_content,
                        :code_language, :work_time, :work_hour
  mount_uploader :picture, ImageUploader
end
