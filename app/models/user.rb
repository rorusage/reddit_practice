class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reddits
  has_many :comments
  has_many :votes
  has_many :voted_reddits, through: :votes, source: :reddit

  def has_voted_this_reddit?(reddit)
    voted_reddits.include?(reddit)
  end

  def cancel_vote!(reddit)
    voted_reddits.delete(reddit)
  end

  def vote_up!(reddit)
    voted_reddits << reddit
    v = votes.find_by_reddit_id(reddit)
    v.update_attribute(:vote_result,"vote_up")
  end

  def vote_down!(reddit)
    voted_reddits << reddit
    v = votes.find_by_reddit_id(reddit)
    v.update_attribute(:vote_result,"vote_down")
  end
end
