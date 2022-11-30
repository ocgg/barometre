class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
    @events = Event.all
    @bookmarks = current_user.bookmarks if user_signed_in?
    @bookmark = Bookmark.new
    @venues = Event.all.map(&:venue)
    @markers = @venues.map do |venue|
      {
        lat: venue.latitude,
        lng: venue.longitude,
        info_window: render_to_string(partial: "info_window", locals: { venue: venue })
      }
    end
  end

  def show
    @event = Event.find(params[:id])
    @bookmark = Bookmark.new
    @markers = [{ lat: @event.venue.latitude, lng: @event.venue.longitude }]
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save!
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def event_params
    params.require(:event).permit(:name, :date, :description, :venue)
  end #cette méthode devra etre adaptée au projet, elle est nécessaire dans le setup de cloudinary (Pierre)
end
