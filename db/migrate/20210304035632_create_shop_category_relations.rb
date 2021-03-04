class CreateShopCategoryRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :shop_category_relations do |t|

      t.timestamps
    end
  end
end
