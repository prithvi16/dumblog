class RegistrationsController < Devise::RegistrationsController
	prepend_before_action :check_captcha, only: [:create]


	private
	def sign_up_params
		params.require(:user).permit(:email, :user_name, :password,
		:subdomain,
		:password_confirmation)
	end
	def account_update_params
		params.require(:user).permit(:email, :user_name, :password,:subdomain,
		:password_confirmation, :current_password)
	end

def check_captcha
    unless verify_recaptcha
      self.resource = resource_class.new
      respond_with_navigational(resource) { render :new }
    end
  end


end