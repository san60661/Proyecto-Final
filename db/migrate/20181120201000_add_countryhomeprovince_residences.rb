class AddCountryhomeprovinceResidences < ActiveRecord::Migration[5.2]
  def change
    add_column :residences, :country, :string
    add_column :residences, :home, :string
    add_column :residences, :province, :string
  end
end
