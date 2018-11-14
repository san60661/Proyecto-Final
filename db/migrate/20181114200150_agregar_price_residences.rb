class AgregarPriceResidences < ActiveRecord::Migration[5.2]
  def change
  	add_column :residences, :price, :float
  end
end
