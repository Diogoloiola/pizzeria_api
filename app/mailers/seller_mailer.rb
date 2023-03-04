class SellerMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email
    @seller = params[:seller]
    @url = 'http://example.com/login'
    mail(to: @seller.email, subject: 'Welcome to My Awesome Site')
  end
end
