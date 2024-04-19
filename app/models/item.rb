class Item < ApplicationRecord
  belongs_to :genre
  has_one_attached :photo_image, dependent: :destroy
  has_many :evaluations, dependent: :nullify
  has_one_attached :image

  validates :name, presence: true
  validates :price, presence: true
  validates :genre_id, presence: true
  validates :image, presence: true


end

