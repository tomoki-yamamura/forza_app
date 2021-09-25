require 'rails_helper'

describe InquiryMailer do

  describe '#send_mail' do
    subject(:mail) do
    inquiry = FactoryBot.build(:inquiry)
      described_class.send_mail(inquiry).deliver_now
      ActionMailer::Base.deliveries.last
    end

    context 'when send_mail' do
      it { expect(mail.from.first).to eq(ENV['FORZA_EMAIL']) }
      it { expect(mail.to.first).to eq(ENV['FORZA_EMAIL']) }
      it { expect(mail.subject).to eq('お問い合わせ通知') }
    end
  end
end