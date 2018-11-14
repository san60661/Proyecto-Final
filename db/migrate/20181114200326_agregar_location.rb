class AgregarLocation < ActiveRecord::Migration[5.2]
  def change
  	add_column :residences, :location, :string
  end
end
