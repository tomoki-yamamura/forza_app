class InquiryMailer < ApplicationMailer
  
  def send_mail(inquiry)
    @inquiry = inquiry
    mail(
      from: "forza.kanazawa.volleyball@gmail.com",
      to:   "forza.kanazawa.volleyball@gmail.com",
      subject: 'お問い合わせ通知'
    )
  end
  
end
