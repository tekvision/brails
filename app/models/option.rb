class Option
  include Mongoid::Document

field :label, type: String
  field :value, type: String
  field :is_valid, type: Boolean
  belongs_to :question
end
