class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  private 
    def verified_user
      redirect to '/' unless valid
    end

    def valid
      !!current_user
    end

    def current_user
      User.find_by(id:session[:user_id])
    end
end
