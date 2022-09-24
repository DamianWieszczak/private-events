class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_event, only: [:show, :edit, :update, :destroy]


  def index
    @events = Event.all
  end

  def join
    @event = Event.find(params[:id])

    attendees_events = AttendeesEvent.new(attendee_id: current_user.id, event_id: @event.id)
    if attendees_events.save
      redirect_to @event, notice: "You signed up for the event!"
    else
      redirect_to @event, alert: "You are already signed up for this event!"
    end
  end

  def leave
    @event = Event.find(params[:id])
    attendees_events = AttendeesEvent.find_by(attendee_id: current_user.id, event_id: @event.id)
    attendees_events.destroy

    redirect_to @event, notice: "You are no longer participating in this event!"
  end

  def show
    
  end

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to root_path
      flash[:notice] = "Created Successfully"
    else
      render "new"
      flash.now[:alert] = "Something went wrong"
    end
  end

  def edit
    
  end

  def update
    
    if @event.update(event_params)
      redirect_to @event
      flash[:notice] = "Updated Successfully"
    else
      render :edit
      flash.now[:alert] = "Something went wrong"
    end
  end

  def destroy
    
    @event.destroy

    redirect_to root_path
    flash[:notice] = "Deleted Successfully"
  end


  private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :description, :date, :location)
    end
end
