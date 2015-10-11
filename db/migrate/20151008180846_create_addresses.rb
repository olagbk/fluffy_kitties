class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :surname
      t.string :street
      t.string :number
      t.string :city
      t.string :postcode
      t.string :country
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
