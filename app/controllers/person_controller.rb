class PersonController < ApplicationController
	before_action :set_user

	def show

		if @user
		@recent_posts=Kaminari.paginate_array(@user.posts.order(created_at: :desc)).page(params[:page]).per(10)
		@top_posts=Kaminari.paginate_array(@user.posts.order(views: :desc)).page(params[:page]).per(10)
        end
	end

	def tag

		tag=params[:tag]

		@posts=Kaminari.paginate_array(@user.posts.tagged_with(tag)).page(params[:page]).per(10)
		if @post.blank?
	     render status: 404
	end

	end



	def rss

	  if @user
      @posts=@user.posts.last(10)
	  respond_to do |format|

      format.rss { render :layout => false }
	  end
      end

    end


	private

	def set_user
   @user=User.where(subdomain: request.subdomain).first

  if @user.blank?
    flash[:alert]  = "Blog invalid"
    redirect_to root_url(:subdomain=>false)
		end


	end

end
