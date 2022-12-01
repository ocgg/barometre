class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def sewan
  end
  
  def components_olive
  end
end
