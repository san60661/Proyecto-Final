class AddStartDateAuction < ActiveRecord::Migration[5.2]
  def change
    add_column :auctions, :startDate, :text
    add_column :auctions, :actualPrice, :integer
  end
end
