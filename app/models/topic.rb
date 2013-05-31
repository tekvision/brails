class Topic
  include Mongoid::Document

  field :title, type: String
  field :cookies, type: Integer
  field :summary, type: String
  field :is_completed, type: Boolean

  belongs_to :level
  has_many :contents
  has_many :questions
end

