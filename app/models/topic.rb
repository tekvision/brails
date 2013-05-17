class Topic
  include Mongoid::Document
  field :topic_name, type:string
  field :cookies, type:Integer
  field :topic_summary, type:string

  has_one :content
  has_many :questions
  
  has_many :subtopics, class_name: "Topic", :foreign_key =>"subtopic_id"
  belongs_to :topic, class_name: "Topic"

end

