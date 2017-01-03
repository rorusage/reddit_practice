class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.string :reddit_id
      t.string :vote_result

      t.timestamps null: false
    end
  end
end
