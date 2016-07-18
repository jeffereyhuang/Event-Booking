class VenueController < ApplicationController
  def index
    @venues = Venue.all
  end
end
