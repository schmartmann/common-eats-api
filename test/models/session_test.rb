# == Schema Information
#
# Table name: sessions
#
#  id         :uuid             not null, primary key
#  expires_at :datetime
#  user_agent :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  device_id  :string
#  user_id    :uuid
#
require "test_helper"

class SessionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
