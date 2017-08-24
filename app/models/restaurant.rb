require 'geocoder'

class Restaurant < ApplicationRecord
  geocoded_by :address
  after_validation :geocode
  has_many :dishes
  has_many :orders

  def address
    "#{address1}, #{postal_code} #{city}"
  end

end
