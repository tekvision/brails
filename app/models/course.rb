class Course
  include Mongoid::Document
  field :name, type: String
  field :short_name, type: String
  field :description, type: String
  field :index, type: Hash
  field :course_date, type: Date
  field :course_period, type: Boolean
  field :start_date, type: Date
  field :end_date, type: Date
  validates :name, :description, :course_date, :start_date, :end_date, :presence => true
  has_many :parts
end

