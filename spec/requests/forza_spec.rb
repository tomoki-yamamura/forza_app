require 'rails_helper'

RSpec.describe "Forzas", type: :request do
  describe "GET /home" do
    it "returns http success" do
      get "/forza/home"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /about" do
    it "returns http success" do
      get "/forza/about"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /blog" do
    it "returns http success" do
      get "/forza/blog"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /contact" do
    it "returns http success" do
      get "/forza/contact"
      expect(response).to have_http_status(:success)
    end
  end

end
