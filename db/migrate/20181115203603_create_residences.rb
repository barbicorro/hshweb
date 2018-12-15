class CreateResidences < ActiveRecord::Migration[5.1]
  def change
    create_table :residences do |t|
      t.string :title
      t.string :description
      t.string :address
      t.string :country
      t.string :province
      t.string :locality
      t.string :image
      t.integer :price
      t.integer :priceHotSale
      t.timestamps
    end
  end
end
