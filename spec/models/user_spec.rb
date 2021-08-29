require 'rails_helper'

RSpec.describe User, type: :model do

  it "name, email, passwordがある" do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  it "nameがない場合、無効である" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("が空です。")
  end

  it "emailがない場合、無効である" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("が空です。")
  end

  it "nameがない場合、無効である" do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("が空です。")
  end

  it "重複したemailの場合、無効である" do
    FactoryBot.create(:user, email: "a@example.com")
    user = FactoryBot.build(:user, email: "a@example.com")
    user.valid?
    expect(user.errors[:email]).to include("既に使用されています。")
  end

end