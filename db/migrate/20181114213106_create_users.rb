class CreateUsers < ActiveRecord::Migration[5.2]
  def change
      create_table :users do |t|
        t.string :name
        t.string :category
        #t.references :residences, index: true
        t.timestamps
      end
  end
end
