module ApplicationHelper

    def sign_up
      if user_signed_in?
        link_to "Sign up", new_user_registration_path, class: "nav-link disabled"
      else
        link_to "Sign up", new_user_registration_path, class: "nav-link"
      end
    end

    def sign_in
        if user_signed_in?
          link_to "Sign in", new_user_session_path, class: "nav-link disabled"
        else
          link_to "Sign in", new_user_session_path, class: "nav-link"
        end
      end

      def sign_out
        if !user_signed_in?
          link_to "Sign out", destroy_user_session_path, class: "nav-link disabled"
        else
          link_to "Sign out", destroy_user_session_path, :method => :delete,  class: "nav-link"
        end
      end

end
