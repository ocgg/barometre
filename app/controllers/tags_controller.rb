class TagsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  def new
    @tag = Tag.new
    @event = Event.find(params[:event_id])
    @event_ids = params[:event_id].split('/')
    authorize @tag
  end

  def create
    @event_ids = params[:tag][:event_ids].split.map(&:to_i)
    @tags = params[:tag][:subcategory].reject(&:empty?)
    @event_ids.each do |event_id|
      @event = Event.find(event_id)
      @event.tags.destroy_all if @event.tags.any? #si jamais on modifie les tags
      @event_tags = @tags.map do |tag|
        Tag.new(
          event_id:,
          subcategory_id: Subcategory.find_by(name: tag).id
        )
      end
      render :new_event_tag, status: :unprocessable_entity unless @event_tags.each(&:save!)
    end
    redirect_to event_path(Event.find(@event_ids.last))
    authorize @event
  end

  def edit
    @tags = Tag.new
    @event = Event.find(params[:event_id])
    authorize @tag
  end

  def update
    @event = Event.find(params[:event_id])
    @tags = params[:tag][:subcategory].reject(&:empty?)
    @tags = @tags.map do |tag|
      Tag.update(
        event_id: @event.id,
        subcategory_id: Subcategory.find_by(name: tag).id
      )
    end
    if @tags.each(&:update!)
      redirect_to event_path(@event)
    else
      render :new_event_tag, status: :unprocessable_entity
    end

    authorize @event
  end
end
