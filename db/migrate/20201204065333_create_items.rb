class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :explanation
      t.integer :category_id
      t.integer :status_id
      t.integer :delivery_free_id
      t.integer :area_id
      t.integer :day_id
      t.integer :price
      t.integer :user_id
    end
  end
end
