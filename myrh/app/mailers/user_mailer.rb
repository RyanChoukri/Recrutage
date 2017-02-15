class UserMailer < ApplicationMailer

  default from: 'recrutage@gmail.com'

  def welcome_email(data)
    @data = data
    @url  = 'http://localhost:3000/login'
    mail(to: @data[:email], subject: 'Bienvenue sur recrutage')
  end

  def welcome_admin(data)
    @data = data
    @url  = 'http://localhost:3000/confirm'
    mail(to: @data[:email], subject: 'Bienvenue sur recrutage')
  end

  
end
