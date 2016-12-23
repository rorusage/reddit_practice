class AddVoteUpVoteDownVoteDiffToReddit < ActiveRecord::Migration
  def change
    add_column :reddits, :vote_up, :integer, default: 0
    add_column :reddits, :vote_down, :integer, default: 0
    add_column :reddits, :vote_diff, :integer, default: 0
  end
end
