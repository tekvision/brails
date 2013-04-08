class Part
  include Mongoid::Document
  field :part_number, type: String
  field :name, type: String
  field :description, type: String

validates :part_number, :name, :presence => true

belongs_to :course
has_many :chapters

end

