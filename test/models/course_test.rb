# == Schema Information
#
# Table name: courses
#
#  id         :uuid             not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  menu_id    :uuid             not null
#
# Indexes
#
#  index_courses_on_menu_id  (menu_id)
#
# Foreign Keys
#
#  fk_rails_...  (menu_id => menus.id)
#
require "test_helper"

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
