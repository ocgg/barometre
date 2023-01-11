class VenuesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new, :create]

  def index
    @venues = policy_scope(Venue)
    @venues = set_venues
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    set_generic_photo unless @venue.photo.present?
    if @venue.save!
      redirect_to new_venue_event_path(@venue)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :address, :description, :photo)
  end

  def set_venues
    return unless params[:query].present?

    sql_query = <<~SQL
      venues.name ILIKE :query
      OR venues.address ILIKE :query
    SQL
    Venue.where(sql_query, query: "%#{params[:query]}%")
  end

  def set_generic_photo
    @venue.photo.attach(
      io: File.open('app/assets/images/microbw.png'),
      filename: 'microbw.png',
      content_type: 'image/png'
    )
  end
end
