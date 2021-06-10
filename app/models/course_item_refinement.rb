# == Schema Information
#
# Table name: course_item_refinements
#
#  id             :uuid             not null, primary key
#  selection_type :string           default("radio"), not null
#  text           :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  course_item_id :uuid             not null
#
# Indexes
#
#  index_course_item_refinements_on_course_item_id  (course_item_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_item_id => course_items.id)
#
class CourseItemRefinement < ApplicationRecord
  belongs_to :course_item

  SELECTION_TYPE = %w[check radio].freeze

  validates :text, presence: true
  validates :selection_type, inclusion: { in: SELECTION_TYPE }
end
