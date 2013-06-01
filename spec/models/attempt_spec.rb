require 'spec_helper'

describe Attempt do
  context "Fields" do
    it { should have_field(:count).of_type(Integer)}
    it { should have_field(:solved).of_type(Boolean)}
  end

  context "Associations" do
    it { should belong_to(:user)}
    it { should belong_to(:question)}
  end
end
