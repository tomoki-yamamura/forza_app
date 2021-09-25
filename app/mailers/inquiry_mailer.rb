class InquiryMailer < ApplicationMailer
  
  def send_mail(inquiry)
    @inquiry = inquiry
    # mailというハッシュでメール送信時の情報を作成
    mail(
      from: ENV['FORZA_EMAIL'],
      to:   ENV['FORZA_EMAIL'],
      subject: 'お問い合わせ通知'
    )
  end
  
end
