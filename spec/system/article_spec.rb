# require 'rails_helper'

# feature 'Article', type: :system, js: true do
#   before do
#     # 登録しているuserを使うのでcreateとします。
#     user = FactoryBot.create(:user)
#     # deviseのメソッドであるsign_inでログインしています。
#     visit login_path
#     # ログインフォームにEmailとパスワードを入力する
#     fill_in 'session_email', with: "user.email"
#     fill_in 'session_password', with: "user.password"
#     # ログインボタンをクリックする
#     click_on 'Log in'

#   end
#   scenario '投稿ができること' do
#     # deviseのメソッドであるsign_inでログインしています。
#     # visit login_path
#     # 投稿ボタンが存在する
#     click_link "News", match: :first
#     context "有効な新規投稿を送信した場合" do
#       before {
#         fill_in 'article_title', "testだよ"
#         fill_in_rich_text_area "article_body", with: "投稿内容だよ"
#         check 'article_category_ids_1'
#         click_button "新規投稿"
#       }
#       it "投稿できること" do
#         expect(current_path).to eq articles_path
#         expect(page).to have_content "投稿内容だよ"
#       end
#     end
#   end
# end