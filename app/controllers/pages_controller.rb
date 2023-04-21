class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home contact send_contact_mail]

  def home
  end

  def contact
  end

  def send_contact_mail
    @user = user_signed_in? ? current_user.email : 'anonyme'
    @user_email = params['email']
    @content = params['message']
    # raise
    ContactMailer
      .with(user: @user,
            user_email: @user_email,
            content: @content)
      .contact_mail
      .deliver_later
  end
end
