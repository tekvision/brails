require 'spec_helper'

describe User do

  context 'fields' do
     it { should have_field(:email).of_type(String)}
     it { should have_field(:encrypted_password).of_type(String)}
     it { should have_field(:roles).of_type(String)}
  end

  context 'Mass assignment' do
    it { should allow_mass_assignment_of(:email) }
    it { should allow_mass_assignment_of(:roles) }
    it { should allow_mass_assignment_of(:password) }
    it { should allow_mass_assignment_of(:password_confirmation) }
  end

  context 'Required fields' do
    it { should validate_presence_of(:email)}
    it { should validate_presence_of(:password)}
    it { should validate_presence_of(:roles)}
  end

  context 'Validations' do
    it { should validate_uniqueness_of(:email).case_insensitive.with_message("is already taken") }
  end

  context 'Associations' do
    it { should embed_one :profile }
    it { should have_many(:requests)}
    it { should have_many(:questions)}
    it { should have_many(:user_topics)}
    it { should have_many(:bonus_cookies)}
  end
end
