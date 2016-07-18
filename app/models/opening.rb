class Opening < ActiveRecord::Base
  belongs_to :timeslot
  belongs_to :venue
  has_many :bookings
end
