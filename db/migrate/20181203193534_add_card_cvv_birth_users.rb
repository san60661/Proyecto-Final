class AddCardCvvBirthUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :card, :string
  	add_column :users, :cvv, :integer
  	add_column :users, :birth, :date

	end
end

