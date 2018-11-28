class AddResidenceUserReserve < ActiveRecord::Migration[5.2]
  def change
  	add_column :reserves, :user_id, :integer
  	add_column :reserves, :residence_id, :integer
  end
end
