class ContactMailer < ApplicationMailer
  default from: 'contact@barometre.xyz'

  def contact_mail
    @user = params[:user]
    @user_email = params[:user_email]
    @content = params[:content]
    @from = if @user_email != ''
              @user_email
            elsif @user != 'anonyme'
              @user
            else
              'noreply@barometre.xyz'
            end
    mail(
      from: @from,
      to: 'olivier.g@lavache.com',
      subject: "Baromètre : nouveau message"
    )
  end
end
