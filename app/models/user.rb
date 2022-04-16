class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, confirmation: true

  has_many :resumes

  before_save :complex_password

  def self.login(user_data)
    account = user_data[:account]
    password = user_data[:password]

    if account && password
      user = User.find_by("username = ? or email = ?", account, account)
      if user && user.password == Secret::Code.digest_password(password)
        user
      else
        nil
      end
    else
      nil
    end
  end



  private
  def complex_password
    self.password = Secret::Code.digest_password(self.password)
  end

  
end

