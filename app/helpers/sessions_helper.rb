module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def logged_in?
    !current_user.nil?

  end

  def log_out
    session[:user_id] = nil
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
