module ApplicationHelper

	def current_user
	  if session[:user_id]
	    @current_user ||= User.find_by_id(session[:user_id])
	  end
	end
	

	# Returns true if current_user exists, false otherwise
	def logged_in?
	  !current_user.nil?
	end
	
	
	# a convenient method to set the session to given user's id with the `:user_id` key
	def sign_in(user)
	  session[:user_id] = user.id
	end

	def flash_class(level)
	    case level
	        when "info" then "alert alert-info"
	        when "success" then "alert alert-success"
	        when "errors" then "alert alert-warning"
	        when "alert" then "alert alert-danger"
	    end
	end	
	
end
