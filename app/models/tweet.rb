class Tweet < ApplicationRecord
  # Association
  belongs_to :user
  has_many :comments, dependent: :destroy

  # Validations
  validates :body, presence: true
  validates :body, length: { maximum: 140 }
end
