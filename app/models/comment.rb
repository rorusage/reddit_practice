class Comment < ActiveRecord::Base
  belongs_to :reddit
  belongs_to :poster, class_name: "User", foreign_key: :user_id

  def find_poster_name(poster_id)
    print poster_id
     user = User.find(poster_id)
     user.name
  end
end
