class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_owner!
  before_action :configure_permitted_parameters, if: :devise_controller?


	protected
  def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:mob_no, :first_name, :last_name, :email, :password, :password_confirmation) }
  end


	# def after_sign_in_path_for(resource)
	#   if current_owner.role == "admin"
	#     rails_admin.dashboard_path
	#   else
	#     root_path
	#   end
	# end

	# def after_sign_out_path
	# end

end
