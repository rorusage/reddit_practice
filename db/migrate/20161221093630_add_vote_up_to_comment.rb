class AddVoteUpToComment < ActiveRecord::Migration
  def change
    add_column :comments, :vote_up, :integer, default: 0
  end
end
