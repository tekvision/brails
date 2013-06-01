require 'spec_helper'

describe Profile do

  context 'fields' do
      it { should have_field(:first_name).of_type(String)}
      it {should have_field(:last_name).of_type(String)}
      it {should have_field(:nick_name).of_type(String)}
      it {should have_field(:permanent_address).of_type(String)}
      it {should have_field(:permanent_country).of_type(String)}
      it {should have_field(:permanent_state).of_type(String)}
      it {should have_field(:permanent_city).of_type(String)}
      it {should have_field(:local_address).of_type(String)}
      it {should have_field(:local_country).of_type(String)}
      it {should have_field(:local_state).of_type(String)}
      it {should have_field(:local_city).of_type(String)}
      it {should have_field(:contact_number).of_type(Integer)}
      it {should have_field(:date_of_birth).of_type(Date)}
      it {should have_field(:facebook).of_type(String)}
      it {should have_field(:twitter_handle).of_type(String)}
      it { should have_field(:disability).of_type(String)}
      it { should have_field(:disability_percentage).of_type(String)}
  end
  
  context 'Required fields' do
    it { should validate_presence_of(:first_name)}
    it { should validate_presence_of(:last_name)}
    it { should validate_presence_of(:permanent_address)}
    it { should validate_presence_of(:permanent_country)}
    it { should validate_presence_of(:permanent_state)}
    it { should validate_presence_of(:permanent_city)}
    it { should validate_presence_of(:contact_number)}
    it { should validate_presence_of(:date_of_birth)}
  end

  context 'Validations' do
    it { should validate_length_of(:contact_number).within(10) }
    it { should validate_numericality_of(:contact_number).to_allow(:only_integer => true) }
    it { should validate_format_of(:first_name).to_allow("/\A[a-zA-z]+\z/").not_to_allow("")}
    it { should validate_format_of(:last_name).to_allow("/\A[a-zA-z]+\z/").not_to_allow("")}
  end

  context 'Associations' do
    it { should be_embedded_in(:user).as_inverse_of(:profile) }
    it { should belong_to(:local_country).with_foreign_key(:local_country_id) }
    it { should belong_to(:permanent_country).with_foreign_key(:permanent_country_id) }
    it { should belong_to(:local_state).with_foreign_key(:local_state_id) }
    it { should belong_to(:permanent_state).with_foreign_key(:permanent_state_id) }
    it { should belong_to(:local_city).with_foreign_key(:local_city_id) }
    it { should belong_to(:permanent_city).with_foreign_key(:permanent_city_id) }
  end
end
