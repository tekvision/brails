require 'spec_helper'

describe Request do
  context 'fields' do
     it {should have_field(:title).of_type(String)}
     it {should have_field(:body).of_type(String)}
     it {should have_field(:status).of_type(String)}
  end

  context 'required fields' do
     it {should validate_presence_of(:title)}
     it {should validate_presence_of(:body)}
  end

  context 'associations' do
     it {should have_many(:comments)}
  end
end
