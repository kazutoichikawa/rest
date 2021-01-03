class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :shop_id
      t.text :text
      t.timestamps
    end
  end
end
