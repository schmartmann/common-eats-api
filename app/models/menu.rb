class Menu < ApplicationRecord
    belongs_to :restaurant
    has_many :courses
    has_many :operation_hours, as: :schedulable

    validates :name, presence: true, uniqueness: { scope: :restaurant_id }
end
