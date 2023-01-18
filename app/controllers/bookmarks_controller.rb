class BookmarksController < ApplicationController
  def index
    @events = current_user.events
  end

  def new
    @event = Event.find(params[:event_id])
  end

  def create
    @event = Event.find(params[:event_id])
    @bookmark = Bookmark.find_by(user: current_user, event: @event)

    if @bookmark.present?
      @bookmark.destroy!
      redirect_back fallback_location: root_path
    else
      @bookmark = Bookmark.new(event_id: params[:event_id])
      @bookmark.user = current_user
      if @bookmark.save
        redirect_back fallback_location: root_path
      end
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy!
    redirect_back fallback_location: root_path
  end

  # private

  # def bookmark_params
  #   params.require(:event_id).to_i
  # end
end
