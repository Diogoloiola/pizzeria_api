# Preview all emails at http://localhost:3000/rails/mailers/seller
class SellerPreview < ActionMailer::Preview
  def welcome_email
    SellerMailer.with(seller: Seller.last).welcome_email
  end
end
