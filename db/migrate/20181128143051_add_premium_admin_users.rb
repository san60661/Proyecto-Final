class AddPremiumAdminUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :premium, :boolean
  	add_column :users, :admin, :boolean
  end
end