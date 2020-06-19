class ApplicationController < ActionController::Base
    
    protected
    def authenticate_user!
      if user_signed_in?
        redirect_to groups_path
      else
        redirect_to new_user_session_path
        ## if you want render 404 page
        ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
      end
    end
end
