class CreateReddits < ActiveRecord::Migration
  def change
    create_table :reddits do |t|
      t.string :title
      t.string :url

      t.timestamps null: false
    end
  end
end
