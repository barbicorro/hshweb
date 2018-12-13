class CreateComunications < ActiveRecord::Migration[5.1]
  def change
    create_table :comunications do |t|
      t.string :email
      t.string :subject
      t.string :message

      t.timestamps
    end
  end
end
