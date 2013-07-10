require 'spec_helper'

describe BonusRound do
  context "Associations" do
    it {should have_many(:questions)}
    it { should belong_to(:level)}
  end
end
