class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      InquiryMailer.send_mail(@inquiry).deliver_now
      flash[:gotit] = "送信されました!"
      redirect_to new_inquiry_path
    else
      msg = "入力内容に問題があります, 再度入力ください。"
      # 改行させる
      msg = msg.gsub(",","<br>")
      flash.now[:faile] = msg.html_safe
      render "new"
    end
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :message)
  end

end
