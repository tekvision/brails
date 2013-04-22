require 'spec_helper'

describe User do
  context 'fields' do
     it 'should have email'
     it 'should have password'
     it 'should have role'
  end

  context 'required fields' do
     it 'should have email'
     it 'should have password'
     it 'should have role'
  end

  context 'associations' do
     it 'should have many requests'
     it 'embeds one profile'
  end
end
