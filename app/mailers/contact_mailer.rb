class ContactMailer < ApplicationMailer
  default from: 'contact@barometre.xyz'

  def contact_mail
    @user = params[:user]
    @email = params[:email]
    @content = params[:content]
    mail(
      # from: '...',
      to: 'olivier.g@lavache.com',
      subject: "Baromètre : nouveau message"
    )
  end
end
