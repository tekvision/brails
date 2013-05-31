require 'spec_helper'

describe Topic do
  context 'fields' do
    it { should have_field(:title).of_type(String)}
    it { should have_field(:cookies).of_type(Integer)}
    it { should have_field(:summary).of_type(String)}
    it { should have_field(:is_completed).of_type(Boolean)}
  end
  
  context 'required fields' do
    it { should validate_presence_of(:title)}
    it { should validate_presence_of(:cookies)}
    it { should validate_presence_of(:summary)}
  end

  context 'Validations' do
    it {should validate_numericality_of(:cookies).to_allow(:only_integer => true)}
  end

  context 'associations' do
    it { should belong_to(:level)}
    it { should have_many(:contents).with_dependent(:destroy)}
    it { should have_many(:questions).with_dependent(:destroy)}
  end
end
