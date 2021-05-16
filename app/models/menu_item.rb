class MenuItem < ApplicationRecord
  belongs_to :course

  has_many :menu_item_refinements

  validates :name,        presence: true
  validates :price,       presence: true
  validates :description, presence: true
end
