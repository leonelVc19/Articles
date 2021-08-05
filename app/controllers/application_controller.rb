class ApplicationController < ActionController::Base
    before_action :configure_devise_params, :configure_permitted_parameters, if: :devise_controller?
    
    def configure_devise_params
        devise_parameter_sanitizer.permit(:sign_up) do |user|
            user.permit(:name, :paternal_surname, :maternal_surname, :email, :password, :password_confirmation)
        end
    end
    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :paternal_surname, :maternal_surname,:email, :password, :password_confirmation, :current_password) }
    end
end
