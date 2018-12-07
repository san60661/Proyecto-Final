class AddLockedToResidences < ActiveRecord::Migration[5.2]
  def change
    add_column :residences, :locked, :boolean
  end
end
