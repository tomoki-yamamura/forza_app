class InquiryMailer < ApplicationMailer
  def send_mail(inquiry)
    @inquiry = inquiry
    mail(
      # ↓このアプリ
      from: 'system@example.com',
      # 管理emailのアドレス（将来はforzaのやつ）
      to:   'progtab17@gmail.com',
      # メールの件名
      subject: 'お問い合わせ通知'
    )
  end
end
