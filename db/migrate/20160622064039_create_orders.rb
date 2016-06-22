class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.float :total
      t.boolean :status
      t.integer :users_id
      t.references :user

      t.timestamps null: false
    end
  end
end
