class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :host
      t.string :capacity
      t.integer :opening_id
      t.string :description
      t.timestamps null: false
    end
  end
end
