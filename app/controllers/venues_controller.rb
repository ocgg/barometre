class VenuesController < ApplicationController
  def index
    @venues = set_venues
  end

  def new
    @venue = Venue.new
  end

  def create
    redirect_to events_path
  end

  private

  def set_venues
    # Si il y a une requete dans la search bar,
    if params[:query].present?
      # filtrer les events avec cette requête SQL
      sql_query = <<~SQL
        venues.name @@ :query OR venues.address @@ :query
      SQL
      Venue.where(sql_query, query: "%#{params[:query]}%")
    end
    # Sinon, ne rien afficher
  end

end
