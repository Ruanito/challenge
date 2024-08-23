class CreateProduct < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :identifier
      t.integer :quantity
      t.integer :price
      t.string :instructions

      t.timestamps
    end
  end
end
