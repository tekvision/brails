require 'spec_helper'

describe Option do
  context "Fields" do
    it { should have_field(:label).of_type(String)}
    it { should have_field(:value).of_type(String)}
    it { should have_field(:is_attempted).of_type(Boolean)}
  end
  
  context "Required fields" do
    it { should validate_presence_of(:label)}
    it { should validate_presence_of(:is_attempted)}
    it { should validate_presence_of(:question_id)}
  end

  context "Associations" do
    it { should belong_to(:question)}
  end
end
