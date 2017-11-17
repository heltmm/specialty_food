class Review < ActiveRecord::Base
  belongs_to :product
  
  validates :content_body, :presence => true
  validates :rating, :presence => true
end
