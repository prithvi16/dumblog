class CommentsController < ApplicationController
 before_action :set_post 
 before_action :authenticate_user! 


def new
  
  @comment = Comment.new()
  @parent=params[:parent_id]
end




def create

      @comment = @post.comments.build(comment_params)
      @comment.user_id=current_user.id
      print params[:parent_id]
      if params[:parent_id]

      @comment.parent=Comment.find(params[:parent_id])
      end
      if @comment.save
        flash[:notice] = "Successfully created comment."
        redirect_to(post_path(@post))
      else
        flash[:error] = "Error adding comment."
     end
end

  def edit
    @comment = Comment.find(params[:id])
    if current_user==@comment.user
      return
      else
    flash[:alert] = "That comment doesn't belong to you!"
        redirect_to post_path(@post)
     end   
    
  end

  def update
    @comment = Comment.find(params[:id])

    if current_user==@comment.user
      
    @comment.update(comment_params)
    redirect_to(post_path(@comment.post)) 
      else
    flash[:alert] = "That comment doesn't belong to you!"
        redirect_to post_path(@post)
     end   


  end

  def destroy
    @comment=Comment.find(params[:id]) 


if current_user==@comment.user || @comment.post.user == current_user
      
    @comment.destroy
  
    redirect_to(post_path(@comment.post)) 
      else
    flash[:alert] = "That comment doesn't belong to you!"
        redirect_to post_path(@post)
     end  





end


private
def comment_params
 params.require(:comment).permit(:content)
 
end
def set_post
 @post = Post.find(params[:post_id])

end


end
