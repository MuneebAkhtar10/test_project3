class ApplicationController < ActionController::Base
	include Pundit
		protect_from_forgery
	# before_action :authenticate_user!
	before_action :configure_permitted_parameters, if: :devise_controller?
	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :user_type])
		devise_parameter_sanitizer.permit(:bug, keys: [:type, :projectstatus])

	end
end
