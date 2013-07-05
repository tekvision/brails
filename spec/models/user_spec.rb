require 'spec_helper'

describe User do

  context 'fields' do
     it { should have_field(:email).of_type(String)}
     it { should have_field(:encrypted_password).of_type(String)}
     it { should have_field(:roles).of_type(Array)}
  end

  context 'Mass assignment' do
    it { should allow_mass_assignment_of(:email) }
    it { should allow_mass_assignment_of(:roles) }
    it { should allow_mass_assignment_of(:password) }
    it { should allow_mass_assignment_of(:password_confirmation) }
  end

  context 'Required fields' do
    it { should validate_presence_of(:roles)}
  end

  context 'Associations' do
    it { should embed_one :profile }
  end
end
