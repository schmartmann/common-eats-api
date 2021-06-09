# == Schema Information
#
# Table name: restaurants
#
#  id               :uuid             not null, primary key
#  city             :string           not null
#  email            :string           not null
#  name             :string           not null
#  phone            :string           not null
#  postal_code      :string           not null
#  state            :string           not null
#  street_address   :string           not null
#  time_zone        :string           default("UTC"), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  restauranteur_id :string
#
# Indexes
#
#  index_restaurants_on_email  (email) UNIQUE
#  index_restaurants_on_name   (name) UNIQUE
#  index_restaurants_on_phone  (phone) UNIQUE
#
class Restaurant < ApplicationRecord
    belongs_to :restauranteur, class_name: 'User', inverse_of: :restaurants

    has_many :menus
    has_many :restaurant_cuisines
    has_many :cuisines, through: :restaurant_cuisines
    has_many :operation_hours, as: :schedulable

    validates :name, presence: true
    validates :phone, presence: true
    validates :email, presence: true
    validates :street_address, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates :postal_code, presence: true
    validates :time_zone, presence: true, inclusion: { in: ActiveSupport::TimeZone.all.map { |tz| tz.name } }
    validate  :valid_restauranteur

    def valid_restauranteur
        errors.add(:restauranteur_id, 'must be Restauranteur') unless User.find(restauranteur_id).restauranteur
    end
end
