class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :content_body, :presence => true
  validates :rating, :presence => true

  scope :three_most_recent, -> { order(created_at: :desc).limit(3)}
end
