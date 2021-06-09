# == Schema Information
#
# Table name: cuisines
#
#  id         :uuid             not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cuisine < ApplicationRecord
    has_many :restaurant_cuisines

    has_many :restaurants, through: :restaurant_cuisines

    validates :name, presence: true, 
end
