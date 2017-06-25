class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :stret
      t.integer :number
      t.string :city
      t.references :contact, foreign_key: true

      t.timestamps
    end
  end
end
