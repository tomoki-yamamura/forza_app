# require 'rails_helper'

# RSpec.describe "Sessions", type: :request do
#   let(:user) { FactoryBot.create(:user) }

#   describe "delete /logout" do
#     it 'redirects to root_path' do
# # 前章で「post login_path」の箇所はbeforeを使用して書いていましたが、
# # 今回のテストを書くにあたり、以下の箇所に移動させました。
#       post login_path, params: { session: {
#         email: user.email,
#         password: user.password,
#       } }
#       delete logout_path
#       aggregate_failures do
#         expect(response).to redirect_to root_path
#         expect(is_logged_in?).to be_falsy
#       end
#     end
# # 今回のテストはここからです。
#     it 'succeeds logout when user logs out on multiple tabs' do
#       delete logout_path
#       aggregate_failures do
#         expect(response).to redirect_to root_path
#         expect(is_logged_in?).to be_falsy
#       end
#     end
#   end
# end