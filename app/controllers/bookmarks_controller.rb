class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def new
    @event = Event.find(params[:event_id])
  end

  def create
    @bookmark = Bookmark.new(event_id: params[:event_id])
    @bookmark.user_id = current_user.id
    if @bookmark.save
      redirect_to events_path
    else
      render :events, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy!
    redirect_to events_path
  end

  # private

  # def bookmark_params
  #   params.require(:event_id).to_i
  # end
end
