class RedditsController < ApplicationController
  before_action :authenticate_user!
  def index
    @reddits = Reddit.all
  end

  def new
    @reddit = Reddit.new
  end

  def create
    @reddit = current_user.reddits.new(reddit_params)

    if @reddit.save
      redirect_to reddits_path, notice: "成功新增link"
    else
      render :new
    end
  end

  def show
    @reddit = Reddit.find(params[:id])
  end

  def edit
    @reddit = current_user.reddits.find(params[:id])
  end

  def update
    @reddit = current_user.reddits.find(params[:id])

    if @reddit.update(reddit_params)
      redirect_to reddits_path
    else
      render :edit
    end
  end

  def destroy
    @reddit = current_user.reddits.find(params[:id])
    @reddit.destroy
    redirect_to reddits_path, alert: "刪除link"
  end

  private

  def reddit_params
    params.require(:reddit).permit(:title, :url)
  end



end
