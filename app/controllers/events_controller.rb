class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show map filter new create]
  before_action :set_event, only: %i[show edit update destroy]

  def index
    @events = policy_scope(Event)
    @events = apply.where(confirmed: true)
                   .where("date >= ?", Date.today)
                   .order(date: :asc)
    @bookmarks = current_user.bookmarks if user_signed_in?
    @bookmark = Bookmark.new
    @search_url = request.original_url
  end

  def map
    @venues = apply.where("date >= ?", Date.today).map(&:venue)
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
    @bookmark = Bookmark.new
    @markers = [{
      lat: @event.venue.latitude,
      lng: @event.venue.longitude,
      info_window: render_to_string(partial: "info_window", locals: { venue: @event.venue }),
      image_url: helpers.asset_url("pin.svg")
    }]
  end

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    authorize @event
    @event.user = current_user
    @event.venue = Venue.find(params[:venue_id])
    set_generic_photo unless @event.photo.present?
    if @event.save!
      redirect_to new_event_tag_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    set_event
    # @event.venue = Venue.find(params[:venue_id])
    # @event.user = current_user
  end

  def update
    @event.update(event_params)
    redirect_to event_path(@event)
  end

  def destroy
    @event.destroy
    redirect_to events_path, status: :see_other
  end

  def filter
  end

  private

  def set_event
    @event = Event.find(params[:id])
    authorize @event
  end

  def apply
    return Event.all if params['search'].nil?

    events = Event.includes(:tags, :subcategories, :categories).joins(:venue)
    if params['search']['date'] != ""
      case params['search']['date']
      when "today"
        events = events.where(date: Date.today..Date.tomorrow)
      when "tomorrow"
        events = events.where(date: Date.tomorrow..Date.tomorrow + 1)
      when "week"
        events = events.where(date: Date.today...Date.tomorrow + 7)
      when "day"
        events = events.where(date: params['search']['special_date'].to_datetime..params['search']['special_date'].to_datetime+1)
      end
    end

    if params['search']['category'].size > 1
      categ = params['search']['category'].reject(&:empty?)
      events = events.where(categories: { name: categ })

      session[:cat_filter] = params['search']['category']
    end

    if params['search']['subcategory'].size > 2
      subcateg = params['search']['subcategory'].reject(&:empty?)
      events = events.where(subcategories: { name: subcateg })

      session[:subcat_filter] = params['search']['subcategory']
    end

    if params['search']['venue'] != ''
      events = events.where("venues.name ILIKE :query", query: "%#{params['search']['venue']}%")
    end

    events
  end

  # cette méthode devra etre adaptée au projet,
  # elle est nécessaire dans le setup de cloudinary (Pierre)
  def event_params
    params.require(:event).permit(:name, :date, :description, :venue, :photo)
  end

  def set_generic_photo
    @event.photo.attach(
      io: File.open('app/assets/images/microbw.png'),
      filename: 'microbw.png',
      content_type: 'image/png'
    )
  end

  # def set_events
  #   # Si il y a une requete dans la search bar,
  #   if params[:query].present?
  #     # filtrer les events avec cette requête SQL
  #     sql_query = <<~SQL
  #       events.name @@ :query OR events.description @@ :query
  #       OR venues.name @@ :query OR venues.description @@ :query
  #     SQL
  #     Event.where("date >= ?", @today)
  #          .joins(:venue).where(sql_query, query: "%#{params[:query]}%")
  #          .sort_by(&:date)
  #   # Sinon, retourner tous les events
  #   else
  #     Event.where("date >= ?", @today).sort_by(&:date)
  #   end
  # end
end
