class Topic
  include Mongoid::Document
  include Mongoid::Slug


  field :title, type: String
  field :description, type: String

  slug :title

  #validation
  validates :title, :description, :level_id, :presence => true
  attr_accessible :title,  :description, :contents_attributes, :questions_attributes, :level_id

  belongs_to :level
  has_many :contents, dependent: :destroy, order: 'sq_no ASC'
  has_many :attempts
  accepts_nested_attributes_for :contents, allow_destroy: true
end

