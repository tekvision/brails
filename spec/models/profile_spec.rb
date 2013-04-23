require 'spec_helper'

describe Profile do

  context 'fields' do
      it 'should have first name'
      it 'should have last name'
      it 'should have nick name'
      it 'should have permanent address'
      it 'should have local address'
      it 'should have country'
      it 'should have state'
      it 'should have city'
      it 'should have contact number'
      it 'should have date of birth'
      it 'should have facebook'
      it 'should have twitter handle'
  end

  
  context 'Required fields' do
        it 'Should have first name'
        it 'Should have permanant address'
        it 'Should have country'
        it 'Should have state'
        it 'Should have city'
        it 'Should have contact number'
  end

  context 'Validations' do
    it 'Contact number should less than 10 digits'
    it 'First name should have only characters'
  end

  context 'Associations' do
      it 'Should embed in user'
  end
end
