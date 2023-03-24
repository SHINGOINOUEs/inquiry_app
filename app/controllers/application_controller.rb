class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_username

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name], keys: [:branch])
  end

  def after_sign_in_path_for(resource)
    questions_path
  end  

  def set_username
    if user_signed_in?
      @username = current_user.name      
    end
  end

  include Devise::Controllers::Helpers

end

