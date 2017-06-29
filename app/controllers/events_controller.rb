class EventsController < ApplicationController

before_action :authorize, only: [:new]
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @comment = Comment.new
  end

  def new
    @event = Event.new

  end

  def create
    @event = Event.new({name: params[:event][:name],
      date: params[:event][:date],
      location: params[:event][:location],
      pic_url: params[:event][:pic_url]
      })
      @event.user = current_user
      if @event.save
        redirect_to user_path(current_user)
      else
        redirect_to new_users_path

      end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      redirect_to event_path
    else
      redirect_to edit_event_path
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if current_user == @event.user
      @event.destroy
    end
    redirect_to user_path(current_user)
  end
  def event_params
    params.require(:event).permit(:name, :date, :location, :pic_url)
    end
end
