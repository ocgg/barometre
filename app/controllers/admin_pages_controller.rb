class AdminPagesController < ApplicationController
  def admin_home
    authorize self
    @events = Event.where(confirmed: false)
                   .order(date: :asc)
    @venues = Venue.where(confirmed: false)
                   .order(date: :asc)
  end

  def admin_events
    authorize self
    @events = Event.where(confirmed: false)
                   .order(date: :asc)
  end

  def admin_venues
    authorize self
    @venues = Venue.where(confirmed: false)
                   .order(name: :asc)
  end
end
