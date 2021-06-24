class User < ApplicationRecord
  attr_accessor :remember_token
  validates :name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }
  validates :password, presence: true,length: { minimum: 6 }                    #passwordの文字列が空でなく、6文字以上ならtrue
  has_secure_password

  
 # 渡された文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # ランダムなトークンを返す
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # 永続セッションのためにユーザーをデータベースに記憶する
  def remember
    self.remember_token = User.new_token
    self.update_attribute(:remember_digest, User.digest(self.remember_token))
  end

  # 渡されたトークンがダイジェストと一致したらtrueを返す
  def authenticate?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

    # ユーザーのログイン情報を破棄する(DB)
  def forget
    self.update_attribute(:remember_digest, nil)
  end
  
end
