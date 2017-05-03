class PersonController < ApplicationController

	def show
		@user=User.find_by user_name: params[:user]
		@posts=@user.posts
	end

	def tag
		@user=User.find_by user_name: params[:user]
		tag=params[:tag]
		@posts=@user.posts.tagged_with(tag)
	   	
	end
end
