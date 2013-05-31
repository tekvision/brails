require 'spec_helper'

describe Question do
  context "Fields" do
    it 'Should have sequence number'
    it 'Should have query'
    it 'Should have cookies'
  end

context "Required fields" do
    it 'Should have sequence number'
    it 'Should have query'
    it 'Should have cookies'
  end

  context "Validations" do
    it 'Should cookies greater than 0'
  end

  context "Associations" do
    it 'Should have many options'
    it 'Should belongs_to topic'
    it 'Should belongs_to bonus round'
  end
end
