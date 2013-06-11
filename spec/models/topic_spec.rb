require 'spec_helper'

describe Topic do
  context 'fields' do
    it { should have_field(:title).of_type(String)}
    it { should have_field(:description).of_type(String)}
  end
  
  context 'required fields' do
    it { should validate_presence_of(:title)}
    it { should validate_presence_of(:description)}
    it { should validate_presence_of(:level_id)}
  end


  context 'associations' do
    it { should belong_to(:level)}
    it { should have_many(:contents).with_dependent(:destroy)}
    it { should have_many(:questions).with_dependent(:destroy)}
  end

  context "Nested attributes" do
    it { should accept_nested_attributes_for(:contents)}
    it { should accept_nested_attributes_for(:questions)}
  end
end
