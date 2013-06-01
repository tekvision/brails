require 'spec_helper'

describe Comment do

  context 'fields' do
    it {should have_field(:description).of_type(String)}
  end

   context 'associations' do
      it {should belong_to(:request)}
   end
end
