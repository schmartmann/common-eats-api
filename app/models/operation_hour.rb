# == Schema Information
#
# Table name: operation_hours
#
#  id               :uuid             not null, primary key
#  day              :integer          not null
#  end_time         :float            default(23.75), not null
#  schedulable_type :string
#  start_time       :float            default(0.0), not null
#  time_zone        :string           default("UTC"), not null
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
  attr_accessor :start_time_hour, :start_time_minutes

  belongs_to :schedulable, polymorphic: true

  validates :day, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 6 }
  validates :time_zone, presence: true, inclusion: { in: ActiveSupport::TimeZone.all.map { |tz| tz.name } }
  validates :start_time, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 23.75 },  uniqueness: { scope: :schedulable_id }
  validates :end_time, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 23.75 },  uniqueness: { scope: :schedulable_id }
  validate  :start_time_is_before_end_time?

  before_save :assign_parent_time_zone

  scope :open_restaurants, ->  (current_time) {
    where(schedulable_type: 'Restaurant')
      .where('day = ?', current_time.wday)
      .where('start_time <= ?', current_time.hour + (current_time.min.to_f / 60.to_f))
      .where('end_time >= ?', current_time.hour + (current_time.min.to_f / 60.to_f))
  }

  def start_time_is_before_end_time?
    errors.add(:end_time, 'must be later than start time') if start_time >= end_time
  end

  def assign_parent_time_zone
    self.time_zone = schedulable.time_zone
  end
end
