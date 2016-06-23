class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :productName
      t.float :price
      t.string :description
      t.integer :quantily
      t.string :images
      t.string :rating
      t.integer :categories
      t.references :categories

      t.timestamps null: false
    end

  end
end
