require 'spec_helper'

describe Story do
  context 'fields' do
	it 'should have story number'
	it 'should have name'
	it 'should have description'
  end

   context 'required fields' do
	it 'should have story number'
	it 'should have name'
   end
  
   context 'associations' do
	it 'should belongs to story number'
	it 'should have many topics'
   end
end
