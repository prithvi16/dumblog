class ThreadsController < ApplicationController





	before_action :authenticate_user! 

	def index
		@noti_unread=Notification.where(user: current_user).order(created_at: :desc)
		@notifications=Kaminari.paginate_array(@noti_unread).page(params[:page]).per(10)
		@noti_unread.update_all(read: true)

	end
end
