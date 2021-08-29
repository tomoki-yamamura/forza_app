module SessionsHelper
  #true、falseを返す
  def is_logged_in?
    !session[:user_id].nil?
  end

#ログインする
  def log_in_as(user, password: 'password', remember_me: '1')
    post login_path, params: { session: { email: user.email,
                                          password: password,
                                          remember_me: remember_me } }
  end
end