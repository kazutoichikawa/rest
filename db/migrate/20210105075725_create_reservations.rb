class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :date ,        null: false
      t.time :time ,        null: false
      t.integer :n_people,  null: false
      t.references :user,   foreign_key: true
      t.references :shop,   foreign_key: true
      t.timestamps
    end
  end
end
