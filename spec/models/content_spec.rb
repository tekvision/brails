require 'spec_helper'

describe Content do
  context 'fields' do
    it { should have_field(:title).of_type(String)}
    it { should have_field(:content_body).of_type(String)}
    it { should have_field(:sq_no).of_type(Integer)}
    it { should have_field(:transcript).of_type(String) }
  end

  context "Validations" do
    it { should validate_attachment_presence(:topic_content)}
  end

  context 'required fields' do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:content_body)}
    it { should validate_presence_of(:sq_no)}
    it { should validate_presence_of(:topic_id)}
  end

  context 'associations' do
     it { should belong_to(:topic)}
     it { should have_many(:questions).with_dependent(:destroy)}
  end

end
