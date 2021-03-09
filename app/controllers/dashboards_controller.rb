class DashboardsController < ApplicationController
  def index
    @bookings = Booking.all
    @events = Event.all
  end

  def show
    
  end
end
