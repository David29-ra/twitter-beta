class Comment < ApplicationRecord
  # Association
  belongs_to :user
  belongs_to :tweet, counter_cache: true

  # Validations
  validates :body, presence: true
  validates :body, length: { maximum: 140 }
end
