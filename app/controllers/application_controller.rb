class ApplicationController < ActionController::Base
    include Pundit
    
    # Rescuing a denied Authorization in Rails
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    
    private
        def user_not_authorized
            flash[:warning] = "Not authorized"
            redirect_to(request.referrer || root_path)
        end
end
