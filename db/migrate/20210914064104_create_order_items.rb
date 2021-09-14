class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      
      t.integer :item_id
      t.integer :order_id
      t.integer :quantity
      t.integer :price
      t.integer :make_status, defalut: 0

      t.timestamps
    end
  end
end
