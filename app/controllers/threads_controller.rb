class ThreadsController < ApplicationController





	before_action :authenticate_user! 

	def index
		@notifications=Notification.where(user: current_user).order(created_at: :desc).limit(10)

	end
end
