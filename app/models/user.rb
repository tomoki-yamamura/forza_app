class User < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }
  validates :password, presence: true,length: { minimum: 6 }                    #passwordの文字列が空でなく、6文字以上ならtrue
  has_secure_password
end
