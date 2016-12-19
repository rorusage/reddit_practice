class Reddit < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true
  belongs_to :author, class_name: "User", foreign_key: :user_id
  has_many :comments

  def editable_by?(user)
    user == author
  end
end
