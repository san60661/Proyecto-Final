class ChangeDates < ActiveRecord::Migration[5.2]
  def change
    remove_column :auctions, :date
    add_column :auctions, :date, :text

    remove_column :reserves, :date
    add_column :reserves, :date, :text

    remove_column :users, :category
  end
end
