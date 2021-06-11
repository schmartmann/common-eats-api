class CuisineNameNotNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :cuisines, :name, false, "New American"
  end
end
