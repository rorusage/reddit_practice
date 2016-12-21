class CommentsController < ApplicationController
  def new
    @reddit = Reddit.find(params[:reddit_id])
    @comment = @reddit.comments.new
  end

  def create
    @reddit = Reddit.find(params[:reddit_id])
    @comment = @reddit.comments.build(comment_params)
    @comment.poster = current_user

    if @comment.save
      redirect_to reddit_path(@reddit), notice: "發表評論成功～"
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
