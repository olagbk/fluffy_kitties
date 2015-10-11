class CreateInventory < ActiveRecord::Migration
  def change
    create_table :inventory_items do |t|
      t.integer :item_id
      t.integer :order_id
    end
  end
end
