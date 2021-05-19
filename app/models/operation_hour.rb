class OperationHour < ApplicationRecord
  belongs_to :schedulable, polymorphic: true
end
