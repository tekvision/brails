class Nominate
  include Mongoid::Document

  field :name, type: String
  field :email, type: String
  field :mobile, type: Integer
  field :phone_number, type: Integer
  field :address, type: String 
  field :description, type: String

  #validation
  validates :name, :mobile, :address, :presence => true

end
