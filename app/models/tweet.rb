class Tweet < ActiveRecord::Base
  belongs_to :user
  validates :body, presence: true

  validates :body, length: { maximum: 140 }
  default_scope -> { order(created_at: :desc) }
end
