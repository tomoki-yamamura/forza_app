class SessionsController < ApplicationController

  layout 'sessions'

  def new
    # /loginpageにいかせないようにする
    
    redirect_to articles_path if current_user
  end

  def create
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        log_in user
        params[:session][:remember_me] == "1" ? remember(user): forget(user)
        redirect_to articles_url
      else
        flash.now[:danger] = "入力内容に問題があります。"
        render "new"
      end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_url
  end


end
