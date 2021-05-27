# == Schema Information
#
# Table name: menu_items
#
#  id          :uuid             not null, primary key
#  description :string           not null
#  name        :string           not null
#  price       :float            not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  course_id   :uuid             not null
#
# Indexes
#
#  index_menu_items_on_course_id  (course_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#
class MenuItem < ApplicationRecord
  belongs_to :course

  has_many :menu_item_refinements

  validates :name,        presence: true
  validates :price,       presence: true
  validates :description, presence: true
end
