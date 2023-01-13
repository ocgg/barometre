class AdminPagesController < ApplicationController
  def admin_home
    authorize self
    @events = Event.where(confirmed: false)
                   .order(date: :asc)
  end

  def admin
    authorize self
    @events = Event.where(confirmed: false)
                   .order(date: :asc)
  end
end
