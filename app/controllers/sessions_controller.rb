class SessionsController < ApplicationController

  layout 'sessions'

  def new
    # render :layout => nil

  end

  def create
    # render :layout => nil
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        log_in user
        redirect_to login_url
      else
        flash.now[:danger] = "kusomedeteeeee"
        render "new"
      end
    # user = User.find_by(email: params[:session][:email])
    #     if user && user.authenticate(params[:session][:password])
    #        #↓こちらに変更
    #        log_in(user)
    #        #rememberで永続化
    #       #  remember(user)

    #       # 選択式にする
    #       params[:session][:remember_me] == '1' ? remember(user) : forget(user)
    #     else
    #        flash.now[:danger] = '有効なメールアドレス、またはパスワードではありません。'
    #        render 'new'

    #     end
  end

  def destroy
    # render :layout => nil

    log_out
    redirect_to login_url
  end


end
