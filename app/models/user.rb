class User < ActiveRecord::Base
  has_many :tweets, dependent:   :destroy

  has_many :on_relationships,
          class_name:  "Relationship",
          foreign_key: "follower_id",
          dependent:   :destroy

  has_many :following, through: :on_relationships, source: :followed

  has_many :off_relationships,
          class_name:  "Relationship",
          foreign_key: "followed_id",
          dependent:   :destroy

  has_many :followers,
          through: :off_relationships,
          source: :follower




  validates_uniqueness_of :email, on: :create

  EMAIL_REGEX = /\A[\w+\-]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name,  presence: true,
                    length: { maximum: 40 },
                    uniqueness: true
  validates :email, presence: true,
                    length: { maximum: 255 },
                    format: { with: EMAIL_REGEX }

  validates :password, presence: true, length: {minimum: 8 }
  has_secure_password




  def follow(other)
    on_relationships.create(followed_id: other.id)
  end


  def unfollow(other)
    relation = on_relationships.find_by(followed_id: other.id)
    relation.destroy
  end

  def following?(other)
    following.include? other
  end


  def my_feed
    me = self
    id = me.id
    fids = me.following_ids
    Tweet.where("user_id IN (?) OR user_id = ?", fids, id)
  end
end
