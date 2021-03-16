class DashboardsController < ApplicationController
  def index
    user_info(true)
  end

  def show
    user_info(false)
  end

  private

  def user_info(user_exists)
    user = user_exists ? current_user : User.find(params[:id])
    @bookings = Booking.where(user: user)
    @bookings = @bookings.sort_by{|b| b.created_at }.reverse
    @events = Event.where(user: user)
    @events = @events.sort_by{|e| e.starts_at }
  end
end
