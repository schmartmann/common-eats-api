class Course < ApplicationRecord
  belongs_to :menu

  has_many :menu_items
end
