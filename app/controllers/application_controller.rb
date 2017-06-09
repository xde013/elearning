class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

    rescue_from CanCan::AccessDenied do |exception|
      respond_to do |format|
        format.html { redirect_back fallback_location: main_app.root_url, alert: exception.message }
      end
    end
end
