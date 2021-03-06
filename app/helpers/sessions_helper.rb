module SessionsHelper
  # ログイン(一時セッション)
  def log_in(user)
    session[:user_id] = user.id
  end

# ログイン(永続セッション)
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

# 上と逆のこと
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def logged_in?
    # current_userがnilではない
    !current_user.nil?
  end

  def log_out
    # forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end 


  def current_user
   user_id = session[:user_id]
   if user_id
    # find_byを使うとnilが返ってくる
    @current_user ||= User.find_by(id: user_id)
   elsif (user_id = cookies.signed[:user_id])
    user = User.find_by(id: user_id)
    if user && user.authenticated?(cookies[:remember_token])
      log_in user
      @current_user = user
    end
  end

  end



  
end
