class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @today = Date.today
    @events = set_events
    @bookmarks = current_user.bookmarks if user_signed_in?
    @bookmark = Bookmark.new
  end

  def map
    @venues = Event.all.map(&:venue)
    @markers = @venues.map do |venue|
      {
        lat: venue.latitude,
        lng: venue.longitude,
        info_window: render_to_string(partial: "info_window", locals: { venue: venue }),
        image_url: helpers.asset_url("pin.svg")
      }
    end
  end

  def show
    @event = Event.find(params[:id])
    @bookmark = Bookmark.new
    @markers = [{
      lat: @event.venue.latitude,
      lng: @event.venue.longitude,
      info_window: render_to_string(partial: "info_window", locals: { venue: @event.venue })
    }]
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.venue = Venue.find(params[:venue_id])
    set_generic_photo unless @event.photo.present?
    if @event.save!
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def filter
    @event = Event.new
    set_events
  end

  def apply
    @event = Event.where(date: params['/filter']['date'])
                  .joins(:category).where(event.tag.subcategory.category = params['/filter']['category'][1])
                  .joins(:subcategory).where(event.tag.subcategory = params['/filter']['subcategory'][1])
                  .joins(:venue).where(name: params['/filter']['venue'])
                  .sort_by(&:date)
  end

  private

  # cette méthode devra etre adaptée au projet,
  # elle est nécessaire dans le setup de cloudinary (Pierre)
  def event_params
    params.require(:event).permit(:name, :date, :description, :venue)
  end

  def set_events
    return Event.where("date >= ?", @today).sort_by(&:date) unless params[:query].present?

    sql_query = <<~SQL
      events.name @@ :query OR events.description @@ :query
      OR venues.name @@ :query OR venues.description @@ :query
    SQL
    Event.where("date >= ?", @today)
         .joins(:venue).where(sql_query, query: "%#{params[:query]}%")
         .sort_by(&:date)
  end

  def set_generic_photo
    @event.photo.attach(
      io: File.open('app/assets/images/microbw.png'),
      filename: 'microbw.png',
      content_type: 'image/png'
    )
  end
end
