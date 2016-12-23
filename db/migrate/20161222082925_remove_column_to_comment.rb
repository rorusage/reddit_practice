class RemoveColumnToComment < ActiveRecord::Migration
  def change
    remove_column :comments, :vote_up
  end
end
