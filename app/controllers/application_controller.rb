class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit::Authorization

  after_action :verify_authorized, except: %i[index map filter], unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

end
