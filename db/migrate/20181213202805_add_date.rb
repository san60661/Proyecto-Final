class AddDate < ActiveRecord::Migration[5.2]
  def change
  	add_column :hotsales, :date, :string
  end
end
