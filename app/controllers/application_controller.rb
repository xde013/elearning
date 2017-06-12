class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
    
    rescue_from CanCan::AccessDenied do |exception|
      respond_to do |format|
        format.html { redirect_back fallback_location: main_app.root_url, alert: exception.message }
      end
    end

      protected 
    def after_sign_in_path_for(resource)
      sign_in_url = new_user_session_url
      if current_user.admin? 
       rails_admin_path
      else  
        if request.referer == sign_in_url
          super
        else
            root_path
        end
      end
    end

     def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :university_id, :student_role, :teacher_role) }
     end
end
