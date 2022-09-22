class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
    
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to @event
      flash[:success] = "Event '#{@event.title}' created"
    else
      render "new"
      flash.now[:alert] = "Something was wrong with your data"
    end
  end

  def edit
    
  end

  def update
    
    if @event.update(event_params)
      redirect_to @event
      flash[:notice] = "Updated successfully"
    else
      render "edit"
      flash[:alert] = "Something went wrong"
    end
  end

  def destroy
    
    @event.destroy

    redirect_to root_path
    flash[:notice] = "Event deleted successfully"
  end

  private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :description, :date, :location)
    end
end
