class ValueDefaultCredits < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:users, :credits, 2)
  end
end
