class TagsController < ApplicationController
  def new
    @tag = Tag.new
  end

  def create
    @event = Event.find(params[:event_id])
    @tags = params[:tag][:subcategory].reject(&:empty?)
    @tags = @tags.map do |tag|
      Tag.new(
        event_id: @event.id,
        subcategory_id: Subcategory.find_by(name: tag).id
      )
    end
    if @tags.each(&:save!)
      redirect_to event_path(@event)
    else
      render :new_event_tag, status: :unprocessable_entity
    end
  end
end
