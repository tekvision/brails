class UserTopic
  include Mongoid::Document

  belongs_to :user
  has_many :topics
end
