class Profile
  include Mongoid::Document
  field :first_name, type: String
  field :last_name, type: String
  field :nick_name, type: String
  field :permanent_address, type: String
  field :local_address, type: String
  field :country, type: String
  field :state, type: String
  field :city, type: String
  field :contact_number, type: Integer
  field :date_of_birth, type: Date
  field :facebook, type: String
  field :twitter_handle, type: String
  validates :first_name, :permanent_address, :country, :state, :city, :contact_number, :presence => true
end

