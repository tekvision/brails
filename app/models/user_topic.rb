class UserTopic
  include Mongoid::Document
  field :is_completed, type: Boolean, default: false
  field :topic_cookies, type: Integer

  belongs_to :user
  belongs_to :topic
end
