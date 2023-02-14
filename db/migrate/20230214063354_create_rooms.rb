class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :description
      t.string :currency
      t.float :price_per_hour

      t.timestamps
    end
  end
end
