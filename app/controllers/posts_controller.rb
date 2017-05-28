
class PostsController < ApplicationController
	before_action :set_post, only: [:show , :like ]

	before_action :set_new_post , only: [:update ,:destroy ,:edit]

	before_action :authenticate_user!  , except: [:index,:show]
	before_action :owned_post, only: [:edit, :update, :destroy]
skip_before_filter :verify_authenticity_token, :only => :destroy

	def index
		@posts=Post.all

	end
def like
  if @post.liked_by current_user
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    end
end

	def new
		@post=current_user.posts.build
		@new_comment=@post.comments.build

	end

	def create
		@post=current_user.posts.create(post_params)
		if   @post.save
		flash[:notice] = "Post succesfulyy created"
		redirect_to(post_url(@post,:subdomain => @post.user.subdomain))
	else
		@post.errors.full_messages
        flash[:error] = @post.errors.full_messages
		render :new

		end
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
		if @post.save
		redirect_to(post_url(@post,:subdomain => @post.user.subdomain))
        else
		@post.errors.full_messages
        flash[:error] = @post.errors.full_messages
		render :edit

		end
end

	def destroy
    sub = @post.user.subdomain
		@post.destroy
		redirect_to root_url(:subdomain=> sub)
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

   @show_user  =User.where(subdomain: request.subdomain).first

  if @show_user.blank?
    flash[:error] = "Blog invalid"
    redirect_to root_url(:subdomain=>false)
		end

@post = @show_user.posts.friendly.find(params[:id])
  end



def set_new_post
	@post=Post.friendly.find(params[:id])
end


end
