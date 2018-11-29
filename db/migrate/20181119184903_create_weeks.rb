class CreateWeeks < ActiveRecord::Migration[5.1]
  def change
    create_table :weeks do |t|
      t.date :period
      t.integer :status_id
      t.integer :residence_id
      t.integer :sale_id
      t.integer :user_id
      t.timestamps
    end
  end
end
