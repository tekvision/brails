class Question
  include Mongoid::Document
  field :query, type: String

  has_many :answers	
  
end
