class EventsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def article_params
    params.require(:article).permit(:title, :body, :photo)
  end #cette méthode devra etre adaptée au projet, elle est nécessaire dans le setup de cloudinary (Pierre)
end
