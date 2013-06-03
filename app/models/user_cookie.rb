class UserCookie
  include Mongoid::Document
  field :topic_cookies, type: Integer

  belongs_to :user
  belongs_to :topic
end
