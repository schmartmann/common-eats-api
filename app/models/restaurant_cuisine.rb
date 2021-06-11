# == Schema Information
#
# Table name: restaurant_cuisines
#
#  id            :bigint           not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  cuisine_id    :uuid             not null
#  restaurant_id :uuid             not null
#
# Indexes
#
#  index_restaurant_cuisines_on_cuisine_id     (cuisine_id)
#  index_restaurant_cuisines_on_restaurant_id  (restaurant_id)
#
# Foreign Keys
#
#  fk_rails_...  (cuisine_id => cuisines.id)
#  fk_rails_...  (restaurant_id => restaurants.id)
#
class RestaurantCuisine < ApplicationRecord
  belongs_to :restaurant
  belongs_to :cuisine
end
