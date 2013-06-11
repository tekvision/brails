require 'spec_helper'

describe Question do
  context "Fields" do
    it { should have_field(:sq_no).of_type(Integer)}
    it { should have_field(:query).of_type(String)}
    it { should have_field(:cookies).of_type(Integer)}
    it { should have_field(:question_type).of_type(String)}
  end

context "Required fields" do
    it { should validate_presence_of(:sq_no)}
    it { should validate_presence_of(:query)}
    it {should validate_presence_of(:cookies)}
    it { should validate_presence_of(:question_type)}
  end

  context "Validations" do
    it { should validate_numericality_of(:cookies).to_allow(:only_integer => true, :greater_than => 0)}
    it { should validate_numericality_of(:sq_no).to_allow(:only_integer => true, :greater_than => 0)}
  end

  context "Associations" do
    it { should have_many(:options).with_dependent(:destroy)}
    it { should belong_to(:topic)}
    it { should belong_to(:bonus_round)}
    it { should belong_to(:content)}
  end

  context "Nested attributes" do
    it { should accept_nested_attributes_for(:options) }
  end
end
