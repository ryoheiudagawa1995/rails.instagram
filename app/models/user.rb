class User < ApplicationRecord
  mount_uploader :face, FaceUploader
  
  has_secure_password
  before_validation { email.downcase! }

  validates :name ,presence: true
  validates :email, presence: true ,uniqueness: true ,format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :face, presence: true

  validates :password, presence: true, length: {minimum: 6 }

  has_many :pictures
  has_many :favorites, dependent: :destroy
  has_many :favorite_pictures, through: :favorites, source: :picture
end
