
require 'rails_helper'

RSpec.describe 'Sessions', type: :feature do

  before do
    # ユーザを作成する
    user = FactoryBot.create(:user)
  end

  scenario 'ログイン失敗' do
  visit login_path
# 何も入力せずにクリック
  click_on 'Log in'

  expect(page).to have_css '.alert-danger'
  end

  scenario 'ログイン成功' do
  visit login_path
  # ログインフォームにEmailとパスワードを入力する
  fill_in 'session_email', with: "user.email"
  fill_in 'session_password', with: "user.password"
  # ログインボタンをクリックする
  click_on 'Log in'
  # articles_pathへ遷移
  visit articles_path
  end
  
end