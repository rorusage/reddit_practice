class RemoveVoteDownToComment < ActiveRecord::Migration
  def change
    remove_column :comments, :vote_down
    remove_column :comments, :vote_diff
  end
end
