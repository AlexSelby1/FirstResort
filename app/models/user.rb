class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

         has_many :job_application

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
    params.require(:user).permit(:email, :password, :password_confirmation, :remember_me, :images, :isHost, :isCandidate, :country, :file)
  end

end
