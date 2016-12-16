class AddUserIdToReddit < ActiveRecord::Migration
  def change
    add_column :reddits, :user_id, :integer
  end
end
