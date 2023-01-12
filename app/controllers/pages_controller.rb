class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def admin
    # coucou
    authorize self
    @events = Event.where(confirmed: false)
                   .order(date: :asc)
  end
end
