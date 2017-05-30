class SettingsController < ApplicationController
	before_action :authenticate_user!
	def index
		@edit_user=current_user.dup
	end

	def update
		@edit_user = current_user.clone
		if @edit_user.update_attributes(user_params)
			flash.now[:success] = "Successfully updated settings."
			redirect_to root_url(:subdomain => current_user.subdomain)
		end
	end
	private

	def user_params
		params.require(:user).permit(
			:bio , :link1 , :link1t, :link2 , :link2t, :link3 , :link3t, :link4 , :link4t,:link5 , :link5t, :link6 , :link6t , :twitter , :github ,:blog_name,:stackoverflow
		)
	end



end
