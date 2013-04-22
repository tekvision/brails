require 'spec_helper'

describe User do
<<<<<<< HEAD
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
=======
  context 'Required fields' do
    it 'should have email'
    it 'should have password'
  end

  context 'Associations' do
    it 'Should embed one profile'
    it 'should have many requests'
>>>>>>> adee70fee9476273a1487b56267c2ff7be0e2246
  end
end
