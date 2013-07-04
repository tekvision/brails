class Nominate
  include Mongoid::Document

  field :name, type: String
  field :email, type: String
  field :mobile, type: Integer
  field :phone_number, type: Integer
  field :address, type: String 
  field :description, type: String

  #validation
  validates :name, :mobile, :address, :email ,  :presence => true
  validates :mobile , :numericality => "integer" 
  validates :email , :uniqueness => true
  validates :email, :format => { :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i ,
                                 :message => "is not valid"}
end
