class CreateReserves < ActiveRecord::Migration[5.2]
  def change
    create_table :reserves do |t|
      t.date :date

      t.timestamps
    end
  end
end
