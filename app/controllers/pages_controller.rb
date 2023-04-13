class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :contact]

  def home
  end

  def contact
    # @content = params[......]
    # ContactMailer.with(content: @content).contact_mail.deliver_later
  end
end
