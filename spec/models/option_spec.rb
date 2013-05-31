require 'spec_helper'

describe Option do
  context "Fields" do
    it 'Should have label'
    it 'Should have value'
    it 'Should have is_attempted'
  end
  
  context "Required fields" do
    it 'Should have label'
    it 'Should have is_attempted'
  end

  context "Associations" do
    it 'Should belongs_to question'
  end
end
