class AddApprovedToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :approved, :boolean
  end
end
