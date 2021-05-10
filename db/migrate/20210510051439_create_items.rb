class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user, foreign_key:true
      t.integer :category_id, null: false
      t.integer :product_stats_id, null: false
      t.integer :delivery_change_burden_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :delivery_date_id, null: false
      t.string :product_name, null: false
      t.text :product_description, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
