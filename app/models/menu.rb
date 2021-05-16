class Menu < ApplicationRecord
    belongs_to :restaurant
    has_many :courses

    validates :name, presence: true, uniqueness: { scope: :restaurant_id }
end
