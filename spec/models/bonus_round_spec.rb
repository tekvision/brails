require 'spec_helper'

describe BonusRound do
  context 'fields' do
    it { should have_field(:extra_cookies).of_type(Integer)}
  end

  context "Required fields" do
    it { should validate_presence_of(:extra_cookies)}
    it { should validate_presence_of(:level_id)}
  end

  context "Validations" do
    it { should validate_numericality_of(:extra_cookies).to_allow(:only_integer => true, :greater_than => 0)}
  end

  context "Associations" do
    it {should have_many(:questions).with_dependent(:destroy)}
    it { should belong_to(:level)}
    it { should have_one(:bonus_cookie)}
  end
end
