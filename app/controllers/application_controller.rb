class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #ヘルパーが使えるように下記を追記
  include SessionsHelper
  # 環境変数
  # Googleカレンダー表示に必要な情報取得



end
