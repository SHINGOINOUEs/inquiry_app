class Admin::UsersController < ApplicationController
  before_action :authenticate_user! # ログイン済みのユーザーのみアクセスを許可
  before_action :check_admin # 管理者権限を持っているユーザーのみアクセスを許可
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  private

  # 管理者権限を持っているかチェックするメソッド
  def check_admin
    redirect_to root_path, alert: "管理者権限が必要です" unless current_user.admin?
  end

end
