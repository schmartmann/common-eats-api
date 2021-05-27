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
require "test_helper"

class OperationHourTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
