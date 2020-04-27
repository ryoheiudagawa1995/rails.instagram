class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title ,presence: true
  validates :content, presence: true
  validates :image, presence: true
end
