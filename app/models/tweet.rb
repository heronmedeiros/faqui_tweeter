class Tweet < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :body
  
  validates :body, length: { maximum: 140 }
end