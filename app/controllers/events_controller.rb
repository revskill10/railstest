class EventsController < ApplicationController
  before_filter :authenticate_user!
  def index
  		@events = current_user.events
  end
  def create
  	event = current_user.events.build(event_params)
  	event.save
  	redirect_to events_path
  end

  def edit
    @events = current_user.events
    @event = @events.find(params[:id])
    render 'index'
  end
  def update
    event = current_user.events.find(params[:id])
    event.update_attributes(event_params)
    event.save
    redirect_to events_path
  end
  def destroy
    event = current_user.events.find(params[:id])
    event.destroy
    redirect_to events_path
  end
  private
  def event_params
  	params.require(:event).permit(:name, :description)
  end
end
