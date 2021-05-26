# == Schema Information
#
# Table name: restaurants
#
#  id             :uuid             not null, primary key
#  city           :string           not null
#  email          :string           not null
#  name           :string           not null
#  phone          :string           not null
#  postal_code    :string           not null
#  state          :string           not null
#  street_address :string           not null
#  time_zone      :string           default("UTC"), not null
#
# Indexes
#
#  index_restaurants_on_email  (email) UNIQUE
#  index_restaurants_on_name   (name) UNIQUE
#  index_restaurants_on_phone  (phone) UNIQUE
#
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

    # scope :is_open, lambda {
    #     left_joins(:operation_hours)
            # .where('operation_hours.day.to_i == ?', Time.zone.now.wday)
            # .where('operation_hours.start_time.to_datetime <= ?', Time.zone.now)
            # .where('operation_hours.end_time.to_datetime >= ?', Time.zone.now)
    }

    # def is_open_now
    #     Time.zone = time_zone
    #     current_week_day = Time.zone.now.wday
    #     operation_hours.find { |op| op.day.to_i == current_week_day && op.start_time.to_datetime <= Time.zone.now && op.end_time.to_datetime >= Time.zone.now }
    # end
end
