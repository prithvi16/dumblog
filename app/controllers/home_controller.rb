class HomeController < ApplicationController
  def index
  end



  def tag

    tag=params[:tag]

		@posts=Kaminari.paginate_array(Post.tagged_with(tag)).page(params[:page]).per(10)
		if @post.blank?
	     render status: 404

  end
  end

end
