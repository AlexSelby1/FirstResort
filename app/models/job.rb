class Job < ApplicationRecord

  mount_uploader :images, ImageUploader

  has_rich_text :content

  validates_processing_of :images
  validate :image_size_validation

  validates :title, :presence => { message: '*Please enter a title' } 
  validates :title, :length =>{:maximum => 50, message: '*Title is too long'} 
  validates :country, :presence => { message: '*Please enter a country' }
  validates :category, inclusion: {in: %w(Bar Floor Kitchen Cafe), message: '*Please enter a category'}
  validates :description, :presence => { message: '*Please enter a description'}
  validates :description, :length => {:within => 10..2000, message: '*Description must be between 10 and 2000 characters'}

private
def image_size_validation
errors[:images] << "should be less than 500KB" if images.size > 0.5.megabytes
end

belongs_to :user, foreign_key: :user_id

has_many :job_applications
has_many :applicants, :through => :job_applications
# has_many :job_applications, :class_name => "JobApplication", :foreign_key => "applicant_id"

end
