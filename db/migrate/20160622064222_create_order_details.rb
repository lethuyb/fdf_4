class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.integer :products_id
      t.integer :orders_id
      t.integer :users_id
      t.integer :quantilyOrdered
      t.float :priceEach
      t.references :user
      t.timestamps null: false
    end
  end
end
