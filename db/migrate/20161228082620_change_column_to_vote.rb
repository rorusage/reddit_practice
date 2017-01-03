class ChangeColumnToVote < ActiveRecord::Migration
  def change
    change_column :votes, :reddit_id, :integer
  end
end
