class OmniauthCallbacksController < Devise::OmniauthCallbacksController

	def google_oauth2

		if User.domain_valid?(request.env["omniauth.auth"].info.email)

		  @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)
		  if @user.persisted?
		    flash[:notice] = "devise.omniauth_callbacks.success", kind: "Google"
		    sign_in_and_redirect @user, event: :authentication
		  else
		    flash[:error] = "devise.omniauth_callbacks.failure", kind: "Google", reason: "database error"
		    redirect_to new_user_session_url
		  end

		else
			flash[:error] = "devise.failure.invalid_domain", kind: "Google"
			redirect_to new_user_session_url
		end
	end

end
