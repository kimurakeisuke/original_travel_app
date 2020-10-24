class Users::PasswordsController < Devise::PasswordsController
  before_action :check_guest, only: :create

  def check_guest
    # downcaseは小文字に変換
    if params[:user][:email].downcase == "guest@example.com"
      redirect_to root_path, alert: "ゲストユーザーの変更・削除はできません。"
    end
  end
end
