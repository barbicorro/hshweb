class CreateSales < ActiveRecord::Migration[5.1]
  def change
    create_table :sales do |t|
      t.datetime :fechaInicio
      t.float :precioBase
      t.float :precioPuja
      t.datetime :fechaFin
      t.references :week, foreign_key: true

      t.timestamps
    end
  end
end
