class User < ActiveRecord::Base
  has_many :tweets

  validates :name,  presence: true, length: { maximum: 40 }
  validates :email, presence: true, length: { maximum: 255 }
end
