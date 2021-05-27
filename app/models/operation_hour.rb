# == Schema Information
#
# Table name: operation_hours
#
#  id               :uuid             not null, primary key
#  day              :integer
#  end_time         :datetime
#  schedulable_type :string
#  start_time       :datetime
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
  belongs_to :schedulable, polymorphic: true

  validates :day, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 6 }
  validates :time_zone, presence: true, inclusion: { in: ActiveSupport::TimeZone.all.map { |tz| tz.name } }

  validate :start_time_is_before_end_time?

  before_save :assign_parent_time_zone

  scope :restaurants, -> { where(schedulable_type: 'Restaurant') }
  scope :today, lambda { |current_time| where('day = ?', current_time.wday) }


  def start_time_is_before_end_time?
    errors.add(:end_time, 'must be later than start time') if start_time.in_time_zone(time_zone) >= end_time.in_time_zone(time_zone)    
  end

  def assign_parent_time_zone
    self.time_zone = schedulable.time_zone
  end
end
