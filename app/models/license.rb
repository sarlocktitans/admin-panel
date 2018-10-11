class License < ApplicationRecord

	belongs_to :user
	mount_uploader :license_image, ImageUploader
end
