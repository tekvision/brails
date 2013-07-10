class Question
  include Mongoid::Document

  field :sq_no, type: Integer
  field :query, type: String
  field :question_type, type: String

  attr_accessible :sq_no, :query,  :question_type, :topic_id, :bonus_round_id, :options_attributes


  has_many :options, dependent: :destroy
  belongs_to :topic
  belongs_to :bonus_round
  belongs_to :content
  has_many :attempts
  accepts_nested_attributes_for :options, allow_destroy: true

  #validations
  validates :sq_no, :query,  :question_type, :presence => true
  validates :sq_no,  :numericality => {:only_integer => true, :greater_than => 0}

  before_create :setTopic_id

  private

  def setTopic_id
    self.topic = self.content.topic
  end

end
