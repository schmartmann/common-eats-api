# == Schema Information
#
# Table name: operation_hours
#
#  id               :uuid             not null, primary key
#  day              :string
#  end_time         :string
#  schedulable_type :string
#  start_time       :string
#  valid_from       :datetime
#  valid_through    :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  schedulable_id   :uuid
#
# Indexes
#
#  index_operation_hours_on_schedulable  (schedulable_type,schedulable_id)
#
class OperationHour < ApplicationRecord
  belongs_to :schedulable, polymorphic: true

  validates :day, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 7 }

  validate :valid_start_time?
  validate :valid_end_time?
  validate :start_time_is_before_end_time?

  def valid_start_time?
    time_arr = start_time.split(':')

    errors.add(:start_time, 'is not valid HH:MM time') if !valid_hour?(time_arr[0]) || !valid_minutes?(time_arr[1])    
  end

  def valid_end_time?
    time_arr = end_time.split(':')

    errors.add(:end_time, 'is not valid HH:MM time') if !valid_hour?(time_arr[0]) || !valid_minutes?(time_arr[1])    
  end

  def valid_hour?(hour_string)
    hour = hour_string.to_i

    hour >= 0 && hour < 24
  end

  def valid_minutes?(minutes_string)
    minutes = minutes_string.to_i

    minutes >= 0 && minutes < 60
  end

  def start_time_is_before_end_time?
    errors.add(:end_time, 'must be later than start time') if start_time.to_datetime >= end_time.to_datetime    
  end
end
