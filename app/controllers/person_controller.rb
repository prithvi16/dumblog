class PersonController < ApplicationController

	def show
		@user=User.find_by user_name: params[:user]
		if @user
		@posts=@user.posts
        end
	end

	def tag
		@user=User.find_by user_name: params[:user]
		tag=params[:tag]
		@posts=@user.posts.tagged_with(tag)
	   	
	end



	def rss
      @user=User.find_by user_name: params[:user]
	  if @user
      @posts=@user.posts.last(10)
	  respond_to do |format|
      
      format.rss { render :layout => false }
	  end
      end

    end
end
