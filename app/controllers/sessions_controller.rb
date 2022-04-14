class SessionsController < ApplicationController
  def create
    user = User.login(params[:user])
    if user
      redirect_to root_path, notice: "登入成功"
    else
      redirect_to sign_in_users_path, notice: "帳密有誤"
    end
  end

end