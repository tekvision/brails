class Question
  include Mongoid::Document

  field :sq_no, type: Integer
  field :query, type: String
  field :question_type, type: String

  attr_accessible :sq_no, :query, :question_type, :topic_id, :level_id, :options_attributes

  has_many :options, dependent: :destroy
  belongs_to :level
  belongs_to :content
  has_many :attempts
  accepts_nested_attributes_for :options, allow_destroy: true

  #validations
#  validates :sq_no, :query,  :question_type, :presence => true
#  validates :sq_no,  :numericality => {:only_integer => true, :greater_than => 0}
#  validates :options ,:length => {:minimum => 3 , :message => "minimum 3 options required"}

end
