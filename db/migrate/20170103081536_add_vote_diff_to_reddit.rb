class AddVoteDiffToReddit < ActiveRecord::Migration
  def change
    add_column :reddits, :vote_diff, :integer, default:0
  end
end
