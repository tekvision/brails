class Topic
  include Mongoid::Document

  field :title, type: String
  field :cookies, type: Integer
  field :summary, type: String

  #validation
  validates :title, :cookies, :summary, :level_id, :presence => true
  validates :cookies, :numericality => {:only_integer => true}

  belongs_to :level
  has_many :contents, dependent: :destroy
  has_many :questions, dependent: :destroy
  accepts_nested_attributes_for :contents, allow_destroy: true
  accepts_nested_attributes_for :questions, allow_destroy: true
#  accepts_nested_attributes_for :options, allow_destroy: true
end

