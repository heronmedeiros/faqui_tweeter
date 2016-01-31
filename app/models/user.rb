class User < ActiveRecord::Base
  has_many :tweets

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
end
