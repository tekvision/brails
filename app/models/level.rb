class Level
  include Mongoid::Document

  field :level_number, type: Integer
  field :level_name, type: String

  has_many :topics, dependent: :destroy 
  has_one :bonus_round, dependent: :destroy
  accepts_nested_attributes_for :bonus_round, allow_destroy: true

  #validation
  validates :level_number, :level_name, :presence => true
  validates :level_number, :numericality => {:only_integer => true,  :greater_than => 0 }
  
  def calculate_cookies_count
    level_cookies = 0
    topics = self.topics
    topics.each do |topic|
      questions = topic.questions
      topic_cookies = 0
      questions.each do |question|
        topic_cookies = topic_cookies + H_COOKIES[question.question_type]
      end
      level_cookies = level_cookies + topic_cookies          
    end
    level_cookies
  end
end
