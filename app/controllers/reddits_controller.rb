class RedditsController < ApplicationController
  def index
    @reddits = Reddit.all
  end

  def new
    @reddit = Reddit.new
  end
end
