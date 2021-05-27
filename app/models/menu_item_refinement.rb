# == Schema Information
#
# Table name: menu_item_refinements
#
#  id             :uuid             not null, primary key
#  selection_type :string           default("radio"), not null
#  text           :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  menu_item_id   :uuid             not null
#
# Indexes
#
#  index_menu_item_refinements_on_menu_item_id  (menu_item_id)
#
# Foreign Keys
#
#  fk_rails_...  (menu_item_id => menu_items.id)
#
class MenuItemRefinement < ApplicationRecord
  belongs_to :menu_item

  SELECTION_TYPE = %w[check radio].freeze

  validates :text, presence: true
  validates :selection_type, inclusion: { in: SELECTION_TYPE }
end
