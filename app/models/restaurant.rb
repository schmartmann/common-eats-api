class Restaurant < ApplicationRecord
    has_many :menus
    has_many :operation_hours, as: :schedulable

    validates :name, presence: true
    validates :phone, presence: true
    validates :email, presence: true
    validates :street_address, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates :postal_code, presence: true
    validates :time_zone, presence: true, inclusion: { in: ActiveSupport::TimeZone.all.map { |tz| tz.name } }
end