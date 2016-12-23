class RedditsController < ApplicationController
  before_action :authenticate_user!
  def index
    @reddits = Reddit.all.order("vote_up DESC")
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
    @comments = @reddit.comments
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

  def vote_up
    @reddit = Reddit.find(params[:id])
    @reddit.increment!(:vote_up)
    new_vote_diff = find_vote_diff(@reddit)
    @reddit.update_attribute(:vote_diff, new_vote_diff)
    redirect_to reddits_path, notice: "vote up"
  end

  def vote_down
    @reddit = Reddit.find(params[:id])
    @reddit.increment!(:vote_down)
    new_vote_diff = find_vote_diff(@reddit)
    @reddit.update_attribute(:vote_diff, new_vote_diff)
    redirect_to reddits_path, notice: "vote down"
  end

  private

  def reddit_params
    params.require(:reddit).permit(:title, :url)
  end

  def find_vote_diff(reddit_instance)
    rvu = reddit_instance.vote_up
    rvd = reddit_instance.vote_down
    new_vote_diff = rvu - rvd
  end

end
