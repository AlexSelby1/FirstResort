class JobApplication < ApplicationRecord

  mount_uploader :images, ImageUploaderUploader

  validates_processing_of :images
  validate :image_size_validation

private
def image_size_validation
errors[:images] << "should be less than 500KB" if images.size > 0.5.megabytes
end

belongs_to :user

end
