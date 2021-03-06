class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    added_attrs = [:name]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def check_guest
    email = resource&.email || params[:user][:email].downcase
    if email == "guest@example.com"
      redirect_to root_path, alert: "ゲストユーザーの変更・削除はできません。"
    end
  end
end
