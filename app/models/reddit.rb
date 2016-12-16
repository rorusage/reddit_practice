class Reddit < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true
  belongs_to :author, class_name: "User", foreign_key: :user_id
end
