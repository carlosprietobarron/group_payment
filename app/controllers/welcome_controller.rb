class WelcomeController < ApplicationController
  def index
    authenticate_user!
  end
end
