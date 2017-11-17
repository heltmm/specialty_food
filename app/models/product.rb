class Product < ActiveRecord::Base
  has_many :reviews

  validates :name, :presence => true
  validates :cost, :presence => true
  validates :img, :presence => true
  validates :country_of_origin, :presence => true

  scope :three_most_recent, -> { order(created_at: :desc).limit(3)}

  scope :american, -> { where(country_of_origin: "United States of America")}

  scope :search, -> (name_parameter) { where("name like ?", "%#{name_parameter}%")}
end
