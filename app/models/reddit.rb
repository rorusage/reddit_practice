class Reddit < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true
  belongs_to :author, class_name: "User", foreign_key: :user_id
  has_many :comments
  has_many :votes
  has_many :voters, through: :votes, source: :user

  def editable_by?(user)
    user == author
  end

  def update_vote_diff
    new_vote_diff = get_up_votes - get_down_votes
    update_attribute(:vote_diff, new_vote_diff)
  end

  def get_up_votes
    votes.where(:vote_result => "vote_up").count
  end

  def get_down_votes
    votes.where(:vote_result => "vote_down").count
  end

end
