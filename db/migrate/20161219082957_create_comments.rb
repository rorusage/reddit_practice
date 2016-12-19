class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :reddit_id
      t.string :author

      t.timestamps null: false
    end
  end
end
