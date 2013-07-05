require 'spec_helper'

describe Profile do

  context 'fields' do
      it { should have_field(:first_name).of_type(String)}
      it {should have_field(:last_name).of_type(String)}
      it {should have_field(:nick_name).of_type(String)}
      it {should have_field(:permanent_address).of_type(String)}
      it {should have_field(:country).of_type(String)}
      it {should have_field(:state).of_type(String)}
      it {should have_field(:city).of_type(String)}
      it {should have_field(:contact_number).of_type(Integer)}
      it {should have_field(:date_of_birth).of_type(Date)}
      it {should have_field(:facebook).of_type(String)}
      it {should have_field(:twitter).of_type(String)}
      it { should have_field(:disability).of_type(String)}
      it { should have_field(:disability_percentage).of_type(String)}
  end
  
  context 'Required fields' do
    it { should validate_presence_of(:first_name)}
    it { should validate_presence_of(:permanent_address)}
    it { should validate_presence_of(:country)}
    it { should validate_presence_of(:state)}
    it { should validate_presence_of(:city)}
    it { should validate_presence_of(:contact_number)}
  end

  context 'Validations' do
    it { should validate_numericality_of(:contact_number).to_allow(:only_integer => true) }
    it { should validate_format_of(:first_name).to_allow("Name").not_to_allow("453454566dfgd5756")}
    it { should validate_format_of(:last_name).to_allow("BigName").not_to_allow("dfsf4534gfgf")}
  end

  context 'Associations' do
    it { should be_embedded_in(:user) }
  end
end
