require 'spec_helper'

describe Level do
  context 'fields' do
    it { should have_field(:level_name).of_type(String)}
    it { should have_field(:level_number).of_type(Integer)}
  end
  
  context "Required fields" do
    it { should validate_presence_of(:level_number)}
    it { should validate_presence_of(:level_name)}
    end

  context "Validations" do
    it { should validate_numericality_of(:level_number).to_allow(:only_integer => true, :greater_than => 0)}
  end

  context "Associations" do
    it { should have_many(:topics).with_dependent(:destroy)}
    it { should have_many(:questions).with_dependent(:destroy) }
  end

  context "Nested attributes" do
    it { should accept_nested_attributes_for(:questions) }
  end
end

