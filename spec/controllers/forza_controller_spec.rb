require 'rails_helper'

RSpec.describe ForzaController, type: :controller do
  describe "#home" do
     # 200レスポンスを返すこと
     it "returns a 200 response" do

      get :home
      expect(response).to have_http_status "200"
      end
  end
end