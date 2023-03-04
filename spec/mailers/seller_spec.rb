require 'rails_helper'

RSpec.describe SellerMailer, type: :mailer do
  describe 'instrutions' do
    let(:seller) { create(:seller) }
    let(:mail) { described_class.with(seller:).welcome_email.deliver_now }

    it 'Valida se nome é o mesmo do usuário' do
      expect(mail.body.encoded).to match(seller.name)
    end

    it 'valida se o email que está sendo enviado é realmente para o destinatário' do
      expect(mail.to).to eq([seller.email])
    end

    it 'Valida se o assunto do email está correto' do
      expect(mail.subject).to eq('Bem vindo ao nosso site')
    end
  end
end
