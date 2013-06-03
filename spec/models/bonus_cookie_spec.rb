require 'spec_helper'

describe BonusCookie do
  context "Field" do
    it { should have_field(:cookies).of_type(Integer)}
    it { should have_field(:is_locked)of_type(Boolean)}
  end

  context "Required fields" do
    it { should validate_presence_of(:cookies)}
    it { should validate_presence_of(:user_id)}
    it { should validate_presence_of(:bonus_round_id)}
  end

  context "Validation" do
    it { should validate_numericality_of(:cookies).to_allow(:only_integer => true)}
  end

  context "Associations" do
    it { should belong_to(:user)}
    it { should belong_to(:bonus_round)}
  end
end
