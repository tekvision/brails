require 'spec_helper'

describe Question do
  context "Fields" do
    it { should have_field(:sequence_number).of_type(Integer)}
    it { should have_field(:query).of_type(String)}
    it { should have_field(:cookies).of_type(Integer)}
  end

context "Required fields" do
    it { should validate_presence_of(:sequence_number)}
    it { should validate_presence_of(:query)}
    it {should validate_presence_of(:cookies)}
  end

  context "Validations" do
    it { should validate_numericality_of(:cookies).to_allow(:only_integer => true, :greater_than => 0)}
    it { should validate_numericality_of(:sequence_number).to_allow(:only_integer => true, :greater_than => 0)}
  end

  context "Associations" do
    it { should have_many(:options).with_dependent(:destroy)}
    it { should belong_to(:topic)}
    it { should belong_to(:bonus_round)}
  end
end
