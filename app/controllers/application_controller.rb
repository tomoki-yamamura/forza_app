class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #ヘルパーが使えるように下記を追記
  include SessionsHelper
end
