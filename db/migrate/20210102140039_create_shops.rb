class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :shop_name,      null: false
      t.integer :genre_id,      null: false
      t.text :profile,          null: false
      t.string :p_num,            null: false
      t.string :p_code,         null: false
      t.integer :prefecture_id, null: false
      t.string :city,           null: false
      t.string :address,        null: false
      t.string :building
      t.references :user,       foreign_key: true
      t.timestamps
    end
  end
end
