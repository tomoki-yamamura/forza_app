module SessionsHelper
 # 渡されたユーザーでログインする
  def log_in(user)
    session[:user_id] = user.id
  end

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
    !current_user.nil?

  end

  def log_out
    # session[:user_id] = nil 下に書き換え
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end 

  def current_user
    if session[:user_id]
      #  ifを使うのはDBの問い合わせ数を減らすため
      User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  
end
