class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #ヘルパーが使えるように下記を追記
  include SessionsHelper
  # 環境変数
  # include ForzaHelper

  # def api_calender
  #   set_google_calender
  # end

  # def api_map
  #   set_google_map
  # end

end
