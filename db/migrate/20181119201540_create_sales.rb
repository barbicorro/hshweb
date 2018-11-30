class CreateSales < ActiveRecord::Migration[5.1]
  def change
    create_table :sales do |t|
      t.date :fechaInicio
      t.date :fechaFin
      t.time :horaInicio
      t.float :precioBase
      t.float :precioPuja
      t.integer :ganadorActual
      t.integer :week_id
      t.integer :residence_id

      t.timestamps
    end
  end
end
