class CreateInscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :inscriptions do |t|
     t.integer :week_id
     t.integer :user_id

      t.timestamps
    end
  end
end
