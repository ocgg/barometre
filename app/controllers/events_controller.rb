class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
    @events = set_events
    @bookmarks = current_user.bookmarks if user_signed_in?
    @bookmark = Bookmark.new
  end

  def show
    @event = Event.find(params[:id])
    @bookmark = Bookmark.new
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

  private

  def event_params
    params.require(:event).permit(:name, :date, :description, :venue)
  end #cette méthode devra etre adaptée au projet, elle est nécessaire dans le setup de cloudinary (Pierre)

  def set_events
    if params[:query].present?
      sql_query = <<~SQL
        events.name @@ :query OR events.description @@ :query
        OR venues.name @@ :query OR venues.description @@ :query
      SQL
      Event.joins(:venue).where(sql_query, query: "%#{params[:query]}%")
    else
      Event.all
    end
  end
end
