class Profile
  include Mongoid::Document
  embedded_in :user

  field :first_name, type: String
  field :last_name, type: String
  field :nick_name, type: String
  field :correspondence_address, type: String
  field :country, type: String
  field :state, type: String
  field :city, type: String
  field :contact_number, type: Integer
  field :date_of_birth, type: Date
  field :facebook, type: String
  field :twitter, type: String
  field :disability, type: String
  field :disability_percentage, type: String

  validates :first_name, :correspondence_address, :country, :state, :city, :contact_number, :presence => true
  validates :first_name,  :last_name, :format => {:with => /\A[a-zA-z]+\z/, :message => "Only letters allowed."}  
  validates :contact_number, :numericality =>true
end

