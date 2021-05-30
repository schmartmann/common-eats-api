# == Schema Information
#
# Table name: users
#
#  id              :uuid             not null, primary key
#  admin           :boolean          default(FALSE), not null
#  customer        :boolean          default(FALSE), not null
#  email           :string           not null
#  first_name      :string           not null
#  last_name       :string           not null
#  password_digest :string
#  phone           :string           not null
#  restauranteur   :boolean          default(FALSE), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
