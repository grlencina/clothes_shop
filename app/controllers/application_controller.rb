class ApplicationController < ActionController::Base
	include Pundit


  	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

	private

  	def user_not_authorized(exception)
    	redirect_to root_path
  	end
end

