class SellerMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email
    @seller = params[:seller]
    @url = 'http://example.com/login'
    mail(to: @seller.email, subject: 'Bem vindo ao nosso site')
  end
end
