class Job < ApplicationRecord
  # Associations 
  has_many :job_applications
  has_many :applicants, :through => :job_applications
  belongs_to :user, foreign_key: :user_id
  has_rich_text :description

  # Mount uploader to upload images on form.
  mount_uploader :images, ImageUploader

# Validations
  validates_processing_of :images
  validate :image_size_validation
  validates :title, :presence => true, :length =>{:maximum => 50}
  validates :country, :presence => true
  validates :category, inclusion: {in: %w(Bar Floor Kitchen Cafe)}
  validates :description, :presence => true,  :length => {:within => 10..2000}

  private
  # Validates image file size.
  def image_size_validation
    message[:images] << "should be less than 500KB" if images.size > 0.5.megabytes
  end

end
