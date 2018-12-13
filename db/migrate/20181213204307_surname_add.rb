class SurnameAdd < ActiveRecord::Migration[5.2]
  def change
  		add_column :users, :surname, :string
  		add_column :users, :image, :string
  end
end
