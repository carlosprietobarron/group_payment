class UserController < ApplicationController
  def show
    @user = current_user
  end

  def index
    @users=User.all
  end

  def profile
    @user = User.find(params[:id])
  end
end
