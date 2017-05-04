
require 'uri'
class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update,:edit,
	:destroy]
	before_action :authenticate_user!  , except: [:index,:show]
	before_action :owned_post, only: [:edit, :update, :destroy]


	def index
		@posts=Post.all    

	end


	def new
		@post=current_user.posts.build
		@new_comment=@post.comments.build

	end 

	def create
		@post=current_user.posts.create(post_params)    
		redirect_to(post_path(@post))
	end

	def show
		
		 if request.path != post_path(@post)
      return redirect_to @post, :status => :moved_permanently
    end
		recently_viewed = cookies[:viewd_posts].to_s.split(':')
		if not recently_viewed.include?(@post.id.to_s)
			@post.update_column(:views,  @post.views+1 )
			recently_viewed << @post.id.to_s
		end
		cookies[:viewd_posts] = {
			value:    recently_viewed.join(':'),
			expires:  10.minutes.from_now
		}
		@user= User.find(@post.user_id)
	end


	def edit
		
	end

	def update
		@post.slug=nil
		@post.update_attributes(post_params)
		redirect_to(post_path(@post))    
	end

	def destroy
		  
		@post.destroy
		redirect_to posts_path
	end



	private 
	def post_params
				params.require(:post).permit(:title , :body , :tag_list)
	end

	def owned_post
		unless current_user==@post.user
			flash[:alert] = "That post doesn't belong to you!"
			redirect_to root_path
		end  

	end 
	def set_post
		@post = Post.friendly.find(params[:id])
	end


end
