class VenuesController < ApplicationController
  def index
    @venues = set_venues
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    unless @venue.photo.present?
      @venue.photo.attach(io: File.open('app/assets/images/microbw.png'), filename: 'microbw.png', content_type: 'image/png')
    end
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
    # Si il y a une requete dans la search bar,
    if params[:query].present?
      # filtrer les events avec cette requête SQL
      sql_query = <<~SQL
        venues.name ILIKE :query
        OR venues.address ILIKE :query
      SQL
      Venue.where(sql_query, query: "%#{params[:query]}%")
    end
    # Sinon, ne rien afficher
  end

end
