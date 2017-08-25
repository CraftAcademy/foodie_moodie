class Dish < ApplicationRecord
  belongs_to :restaurant
  has_one :dish_category
end
