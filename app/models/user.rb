class User < ApplicationRecord
  mount_uploader :face, FaceUploader
  validates :name ,presence: true
  validates :email, presence: true ,uniqueness: true
  validates :face, presence: true
  before_validation { email.downcase! }
  has_secure_password
  validates :password, presence: true, length: {minimum: 6 }
end
