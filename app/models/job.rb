class Job < ApplicationRecord

  mount_uploader :images, ImageUploader

  validates_processing_of :images
  validate :image_size_validation

  validates :title, :presence => true, :length =>{:maximum => 50}
  validates :description, :presence => true, :length => {:within => 10..2000}

private
def image_size_validation
errors[:images] << "should be less than 500KB" if images.size > 0.5.megabytes
end

belongs_to :user, optional: true, foreign_key: :user_id

has_many :job_applications
has_many :applicants, :through => :job_applications
# has_many :job_applications, :class_name => "JobApplication", :foreign_key => "applicant_id"

end
