class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home contact send_contact_mail]

  def home
  end

  def contact
  end

  def send_contact_mail
    ContactMailer
      .with(user: user_signed_in? ? current_user.email : 'anonyme',
            email: params['email'],
            content: params['message'])
      .contact_mail
      .deliver_later
    redirect_to events_path, notice: "Votre message a bien été envoyé à l'équipe Baromètre !"
  end
end
