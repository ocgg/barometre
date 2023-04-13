class ContactMailer < ApplicationMailer
  default from: 'coucou@barometre.xyz'

  def contact_mail
    # @user = current_user || 'anonyme'
    mail(
      to: 'olivier.g@lavache.com',
      subject: 'Coucou du Baro'
    )
  end
end
