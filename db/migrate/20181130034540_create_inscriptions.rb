class CreateInscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :inscriptions do |t|
      t.references :auction, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
