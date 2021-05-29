# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  admin           :boolean
#  customer        :boolean
#  email           :string
#  first_name      :string
#  last_name       :string
#  password_digest :string
#  phone           :string
#  restauranteur   :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
