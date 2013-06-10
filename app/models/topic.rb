class Topic
  include Mongoid::Document

  field :title, type: String
  field :cookies, type: Integer
  field :description, type: String

  #validation
  validates :title, :cookies, :description, :level_id, :presence => true
  validates :cookies, :numericality => {:only_integer => true}
  attr_accessible :title, :cookies, :description, :contents_attributes, :questions_attributes, :level_id

  belongs_to :level
  has_many :contents, dependent: :destroy
  has_many :questions, dependent: :destroy
  accepts_nested_attributes_for :contents, allow_destroy: true
  accepts_nested_attributes_for :questions, allow_destroy: true
#  accepts_nested_attributes_for :options, allow_destroy: true
end

