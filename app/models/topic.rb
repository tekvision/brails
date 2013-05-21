class Topic
  include Mongoid::Document

  field :title, type: String
  field :cookies, type: Integer
  field :summary, type: String

  has_many :content
  end

