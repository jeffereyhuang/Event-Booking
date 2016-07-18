class TimeslotController < ApplicationController
  def index
    @timeslots = Timeslot.all
  end
end
