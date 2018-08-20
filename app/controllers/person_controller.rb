class PersonController < ApplicationController
	before_action :set_user

	def show

		if @user

		@following=Follow.where(follower_id:@user.id).count
		@followers=Follow.where(following_id:@user.id).count

		@recent_posts=Kaminari.paginate_array(@user.posts.order(created_at: :desc)).page(params[:page]).per(10)
		@top_posts=Kaminari.paginate_array(@user.posts.order(views: :desc)).page(params[:page]).per(10)
    @most_used=@user.posts.tags_on(:tags).most_used(10)
		@posts = @user.posts(:select => "title, id, posted_at", :order => "posted_at DESC")
    @post_months = @posts.group_by { |t| t.created_at.beginning_of_month }
end


	end

	def tag

		tag=params[:tag]
      @tag=tag
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
