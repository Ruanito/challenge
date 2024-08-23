class CreatePatient < ActiveRecord::Migration[7.2]
  def change
    create_table :patients do |t|
      t.string :full_name
      t.string :email
      t.string :date_of_birth
      t.string :state

      t.timestamps
    end
  end
end
