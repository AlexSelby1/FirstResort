class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence:  { message: '*Please enter a name' }
  
  validates :email, presence:  { message: '*Please enter an email' }
  validates :email, uniqueness: { message: '*Email is already taken' }

  validates :password, presence: { message: '*Please enter a password' }, on: :new
  validates :password, :length => {minimum: 6, message: '*Password is too short' }, on: :new
  validates :password_confirmation, presence: { message: '*Please confirm your password' }, on: :new

  has_rich_text :body

         has_many :jobs
         has_many :job_applications, class_name: "JobApplication", foreign_key: "applicant_id"
         has_many :jobs, through: :job_applications
     
         has_many :reviews, class_name: "Review", foreign_key: "user_id"

         mount_uploader :images, ImageUploader
         mount_uploader :file, FileUploader


         validates_processing_of :images
         validate :image_size_validation

         validates_inclusion_of :isHost, :in => [true, false]
         validates_inclusion_of :isCandidate, :in => [true, false]

         
  private
  def image_size_validation
    errors[:images] << "should be less than 500KB" if images.size > 0.5.megabytes
  end

  def user_params
    params.require(:user).permit(:name, :email, :encrypted_password, :password_confirmation, :remember_me, :body, :content, :images, :isAdmin, :isHost, :isCandidate, :country, :file)
  end
end
