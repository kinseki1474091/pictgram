class CommentsController < ApplicationController
  def create
    binding.pry
   @comment=current_user.comments.new(comment_params)
   if @comment.save
      redirect_to topics_path, success: '投稿に成功しました'
   else
      flash.now[:danger]='投稿に失敗しました'
      redirect_to topics_path
   end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_content)
  end
  
end
