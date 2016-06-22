class CreateSuggests < ActiveRecord::Migration
  def change
    create_table :suggests do |t|
      t.integer :users_id
      t.text :suggest
      t.references :user
      t.timestamps null: false
    end
  end
end
