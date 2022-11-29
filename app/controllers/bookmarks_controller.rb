class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def new
    @event = Event.find(params[:event_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmarks_params)
    @event = Event.find(params[:event_id])
    @bookmark.event = @event
    @bookmark.user = current_user
    @bookmark.save
  end

  def destroy
  end
end
