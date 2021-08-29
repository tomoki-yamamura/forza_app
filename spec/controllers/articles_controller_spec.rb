require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe "#index" do

    
    # 200レスポンスを返すこと
    it "returns a 200 response" do
    # sign_in @user
    get :index
    expect(response).to have_http_status "200"
    end
  end
end