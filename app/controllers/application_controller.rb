class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Controller から Helper のメソッドを使用
  include SessionsHelper

  private

  # ユーザのコントロールに使用
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
end
