class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #devise :database_authenticatable, :registerable,
         #:recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { maximum: 15 }
  VALID_EMAIL_REGEX=/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  VALID_PASSWORD_REGEX=/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, length: { in: 8..32 }, format: { with: VALID_PASSWORD_REGEX }
  
  has_secure_password
  
  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
  has_many :posts, dependent: :destroy
  has_many :comments
end
