class DashboardsController < ApplicationController
  def index
    @owner = true
    user_info
  end

  def show
    @owner = false
    user_info
  end

  private

  def user_info
    @user = @owner ? current_user : User.find(params[:id])
    @bookings = Booking.where(user: @user)
    @bookings = @bookings.sort_by{|b| b.created_at }.reverse
    @events = Event.where(user: @user)
    @events = @events.sort_by{|e| e.starts_at }
  end
end
