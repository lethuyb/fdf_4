class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :categoryName
      t.string :string

      t.timestamps null: false
    end
  end
end
