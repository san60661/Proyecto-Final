class AddDescription < ActiveRecord::Migration[5.2]
  def change
  	add_column :hotsales, :description, :string
  end
end
