class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    flash[:notice] = "successfully"
  	user_path(current_user)
  end

  def after_destroy_user_seesion_path(resource)
  	root_path

  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:name,:email]
    devise_parameter_sanitizer.permit :sign_in, keys: [:name]
    devise_parameter_sanitizer.permit :account_update, keys: [:name,:introduction]
  end
end
