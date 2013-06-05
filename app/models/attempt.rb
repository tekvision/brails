class Attempt
  include Mongoid::Document

  field :count, type: Integer, default: 0
  field :solved, type: Boolean, default: false
  field :cookies, type: Integer

  belongs_to :user
  belongs_to :question
end
