class Evaluation < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :content, presence: true#, length: { maximum: 5 }
end
