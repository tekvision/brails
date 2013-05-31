require 'spec_helper'

describe Content do
  context 'fields' do
    it 'Should have title'
     it 'should have content body'
    it 'Should have sequence number'
     it 'should have content type'
  end

  context 'required fields' do
    it 'Should have title'
     it 'should have content body'
     it 'should have content type'
    it 'Should have sequence number'
     it 'should have content type'
  end

  context 'associations' do
     it 'should belongs_to topic'
  end

end
