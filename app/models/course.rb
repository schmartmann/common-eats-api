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
class Course < ApplicationRecord
  belongs_to :menu

  has_many :course_items

  validates :name, presence: :true, uniqueness: { scope: :menu_id }
end
