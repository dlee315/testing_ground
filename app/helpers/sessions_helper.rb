module SessionsHelper
	#logs in the given user.
	def log_in(user)
		session[:user_id] = user.id
	end

	#returns the current logged-in user
	def current_user
		@current_user ||=User.find_by(id: session[:user_id])
	end

	# Returns true if the gien user is the current user
	def current_user?(user)
		user == current_user
	end

	#returns true if the user is logged in
	def logged_in?
		!current_user.nil?
	end

	#logs out the current user
	def log_out
		session.delete(:user_id)
		@current_user=nil
	end
end
