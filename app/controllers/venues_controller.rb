class VenuesController < ApplicationController
  def new
    @venue = Venue.new
  end

  def create
    redirect_to events_path
  end
end
