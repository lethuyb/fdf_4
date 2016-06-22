class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :users_id
      t.integer :products_id
      t.text :comment
      t.references :user
      t.references :product

      t.timestamps null: false
    end
  end
end
