class CreatePrices < ActiveRecord::Migration[5.1]
  def change
    create_table :prices do |t|
      t.integer :premium
      t.integer :base

      t.timestamps
    end
  end
end
