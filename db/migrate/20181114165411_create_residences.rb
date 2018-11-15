class CreateResidences < ActiveRecord::Migration[5.1]
  def change
    create_table :residences do |t|
      t.string :title
      t.string :description
      t.references :location, foreign_key: true
      t.string :address

      t.timestamps
    end
  end
end
