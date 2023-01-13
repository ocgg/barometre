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

  def event_confirm
    @event = Event.find(params[:id])
    @event.confirmed = true
    @event.save
    redirect_to admin_events_path, notice: "L'événement a été confirmé."
  end

  def event_reject
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to admin_events_path, notice: "L'événement a été supprimé."
  end

  def venue_confirm
    @venue = Venue.find(params[:id])
    @venue.confirmed = true
    @venue.save
    redirect_to admin_venues_path, notice: "Le lieu a été confirmé."
  end

  def venue_reject
    @venue = Venue.find(params[:id])
    @venue.destroy
    redirect_to admin_venues_path, notice: "Le lieu a été supprimé."
  end
end
