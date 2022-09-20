class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Event '#{@event.title}' created"
      redirect_to @event
    else
      flash.now[:alert] = "Something was wrong with your data"
      render "new"
    end
  end


  private

    def event_params
      params.require(:event).permit(:title, :description, :date, :location)
    end
end
