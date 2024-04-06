class Item < ApplicationRecord
  belongs_to :genre
  has_many :evaluation
end
