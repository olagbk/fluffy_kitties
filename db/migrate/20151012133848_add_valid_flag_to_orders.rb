class AddValidFlagToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :status, :string, :default=> "PROCESSING"
    add_column :orders, :completed, :string, :default=> false
  end
end
