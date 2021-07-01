class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      InquiryMailer.send_mail(@inquiry).deliver
      flash.now[:success] = "送信されました!"
      redirect_to new_inquiry_url
    else
      flash.now[:danger] = "入力内容に問題があります。確認して再度お試しください。"
      render "new"
    end
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :message)
  end

end
