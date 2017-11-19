class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :content_body, :presence => true
  validates :content_body, length: { in: 50..250 }
  validates :rating, :presence => true
  validates :rating, :inclusion => 1..5


  scope :three_most_recent, -> { order(created_at: :desc).limit(3)}
end
