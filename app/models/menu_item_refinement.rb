class MenuItemRefinement < ApplicationRecord
  belongs_to :menu_item

  SELECTION_TYPE = %w[check radio].freeze

  validates :text, presence: true
  validates :selection_type, inclusion: { in: SELECTION_TYPE }
end
