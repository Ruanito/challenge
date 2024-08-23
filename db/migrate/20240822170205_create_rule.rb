class CreateRule < ActiveRecord::Migration[7.2]
  def change
    create_table :rules do |t|
      t.references :product, null: false, foreign_key: true
      t.string :state
      t.string :rule_type
      t.integer :minimum_age

      t.timestamps
    end

    add_index(:rules, [ :state, :rule_type ])
  end
end
