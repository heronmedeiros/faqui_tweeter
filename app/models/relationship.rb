class Relationship < ActiveRecord::Base
  belongs_to :follower, class_name: "User" #seguidor
  belongs_to :followed, class_name: "User" #seguido

  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
