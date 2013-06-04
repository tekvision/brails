require 'spec_helper'

describe Content do
  context 'fields' do
    it { should have_field(:title).of_type(String)}
    it { should have_field(:content_body).of_type(String)}
    it { should have_field(:sequence_number).of_type(Integer)}
    it {should have_field(:content_type).of_type(String)}
  end

  context "Validations" do
    it { should validates_attachment_of(:topic_content)}
  end

  context 'required fields' do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:content_body)}
    it {should validate_presence_of(:content_type)}
    it { should validate_presence_of(:sequence_number)}
    it { should validate_presence_of(:topic_id)}
  end

  context 'associations' do
     it { should belong_to(:topic)}
  end

end
