class UserController < ApplicationController
  def show
    @user = current_user
  end

  def index
    @users = User.all
  end

  def profile
    set_user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
