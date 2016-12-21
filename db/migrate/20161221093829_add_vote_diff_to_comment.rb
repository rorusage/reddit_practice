class AddVoteDiffToComment < ActiveRecord::Migration
  def change
    add_column :comments, :vote_diff, :integer
  end
end
