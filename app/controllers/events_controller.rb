class EventsController < ApplicationController

  def index
    if params[:location].nil?
      @events = Event.where.not(user: current_user)
      @users = User.all
    else
      @events = []
      @user.near("#{params[:location]}", params[:location].to_i, order: :distance)
      @users.each do |user|
        @events << Event.where(user_id: user.id)
      end
      @events.flatten!
    end
    # the `geocoded` scope filters only events with coordinates (latitude & longitude)
    @markers = @events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { event: event })
      }
    end
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      # Chatroom.create
      redirect_to event_path(@event)
    else
      render :new   
    end
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @events = Event.find(params[:id])
    @events.update(event_params)
    redirect_to event_path(@events)
  end
  
  def show
    @event = Event.find(params[:id])
    @bookings = Booking.where(event: @event)
    # initialize chatroom
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @chatrooms = Chatroom.all
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.user == current_user && @event.destroy
      redirect_to events_path, :notice => "Your event has been deleted!"
    else
      render "events/show" 
    end
  end

  private

  #  def total_participants
  #   @events.each do |event|
  #     if event.number_of_participants - event.bookings.count <= 0
  #       "Fully booked"
  #     else
  #       "#{event.number_of_participants - event.bookings.count} spots available"
  #     end
  #   end
  # end

  def event_params
    params.require(:event).permit(:title, :location, :starts_at, :sport, :number_of_participants, :description, :skill_level, :private, :duration)
  end

end
