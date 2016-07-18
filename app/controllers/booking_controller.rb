class BookingController < ApplicationController
  def new
    if params[:opening_id].present? && Opening.find_by_id(params[:opening_id])
      @booking = Booking.new
      @opening = Opening.find(params[:opening_id])
    else
      redirect_to '/browsetime'
    end
  end
  def review
    if params[:approved].present? && params[:approved] == "true"
      @bookings = Booking.where(approved: true)
    elsif params[:approved] == "false"
      @bookings = Booking.where(approved: false)
    elsif params[:approved] == "pending"
      @bookings = Booking.where(approved: nil)
    else
      @bookings = Booking.all
    end
  end
  def index
    @bookings = Booking.all
  end
  def approve
    @booking = Booking.find(params[:id])
    if @booking.update_attribute(:approved, true)
      redirect_to "/bookings"
    else
      render "bookings/review"
    end
  end
  def deny
    @booking = Booking.find(params[:id])
    if @booking.update_attribute(:approved, false)
      redirect_to "/bookings"
    else
      render "bookings/review"
    end
  end
  def create
  	@booking = Booking.new(booking_params)
  	if @booking.save
    	redirect_to '/bookings'
  	else
    	render 'new'
    end
  end
  private
  def booking_params
    	params.require(:booking).permit(:description, :host, :capacity, :opening_id)
  end
end
