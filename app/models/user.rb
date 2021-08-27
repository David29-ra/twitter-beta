class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Association
  has_many :tweets, dependent: :destroy
  has_many :comments, dependent: :destroy

  # validations
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: Devise.email_regexp

  validates :username, presence: true
  validates :username, uniqueness: true

  validates :name, presence: true
end
