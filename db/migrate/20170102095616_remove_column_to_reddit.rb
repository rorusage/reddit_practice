class RemoveColumnToReddit < ActiveRecord::Migration
  def change
    remove_column :reddits, :vote_up
    remove_column :reddits, :vote_down
    remove_column :reddits, :vote_diff
  end
end
