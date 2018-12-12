class AddEndToAuction < ActiveRecord::Migration[5.2]
  def change
    add_column :auctions, :end, :boolean
  end
end
