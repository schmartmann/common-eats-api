# == Schema Information
#
# Table name: menus
#
#  id            :uuid             not null, primary key
#  name          :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  restaurant_id :uuid             not null
#
# Indexes
#
#  index_menus_on_restaurant_id  (restaurant_id)
#
# Foreign Keys
#
#  fk_rails_...  (restaurant_id => restaurants.id)
#
class Menu < ApplicationRecord
    belongs_to :restaurant
    has_many :courses, dependent: :destroy
    has_many :operation_hours, as: :schedulable, dependent: :destroy

    validates :name, presence: true, uniqueness: { scope: :restaurant_id }
end
