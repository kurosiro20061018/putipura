class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :evaluation, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true
  validates :age, presence: true
  validates :skin_quality, presence: true

end
