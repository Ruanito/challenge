class CreateReserves < ActiveRecord::Migration[8.1]
  def change
    create_table :reserves do |t|
      t.references :book, null: false, foreign_key: true
      t.string :status
      t.string :user_email

      t.timestamps
    end
  end
end
