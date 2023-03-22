class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name], keys: [:branch])
  end

  def after_sign_in_path_for(resource)
    questions_path
  end  

end

