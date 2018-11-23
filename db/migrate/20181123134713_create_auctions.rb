class CreateAuctions < ActiveRecord::Migration[5.2]
  def change
    create_table :auctions do |t|
      t.date :date
      t.integer :initPrice
      t.integer :residence_id
      t.integer :user_id

      t.timestamps
    end
  end
end
