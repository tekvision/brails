require 'spec_helper'

describe UserTopic do
  context 'fields' do
    it { should have_field(:is_completed).of_type(Boolean)}
    it { should have_field(:topic_cookies).of_type(Integer)}
  end

  context "Validation" do
    it { should validate_numericality_of(:topic_cookies).to_allow(:only_integer => true)}
  end

  context "Required fields" do
    it { should validate_presence_of(:user_id)}
    it { should validate_presence_of(:topic_id)}
    it { should validate_presence_of(:topic_cookies)}
  end

  context "Validations" do
    it { should belong_to(:user)}
    it { should belong_to(:topic)}
  end
end
