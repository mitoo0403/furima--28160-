class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postcode
      t.integer :area_id
      t.string :municipality
      t.string :address
      t.string :building_name
      t.string :tel
      t.integer :order_id, foreign_key: true 
      t.timestamps
    end
  end
end
