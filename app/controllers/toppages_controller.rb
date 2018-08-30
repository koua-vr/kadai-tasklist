class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @tasks = current_user.tasks.order('created_at DESC').page(params[:page]).per(3)
    end
  end
end
