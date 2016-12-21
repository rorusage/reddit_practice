class AddVoteDownToComment < ActiveRecord::Migration
  def change
    add_column :comments, :vote_down, :integer, default: 0
  end
end
