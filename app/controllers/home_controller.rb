class HomeController < ApplicationController
  def index
    authenticate_user!
  end
end
