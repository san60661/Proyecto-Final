class AddImage < ActiveRecord::Migration[5.2]
  def change
  	add_column :residences, :image, :string
  end
end
