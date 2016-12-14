class RedditsController < ApplicationController
  def index
    @reddits = Reddit.all
  end
end
