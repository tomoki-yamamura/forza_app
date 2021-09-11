class User < ApplicationRecord
  #オブジェクトが保存される前に、インスタンス変数(email)自身に、小文字のemailの値を代入。
  before_save { self.email = email.downcase } 
   
  attr_accessor :remember_token
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true 

  validates :password, presence: true,length: { minimum: 6 }        #passwordの文字列が空でなく、6文字以上ならtrue  
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
  #has_secureで自動でやってくれたことを実装しているだけ
  # このremember_tokenは上記のattr_accesorとは異なる
  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

    # ユーザーのログイン情報を破棄する(DB)
  def forget
    update_attribute(:remember_digest, nil)
  end

  

end
