require 'spec_helper'

describe Profile do
  context 'Fields' do
    it 'Should have first name'
    it 'Should have last name'
        it 'should have nick name'
    it 'Should have permanant address'
    it 'Should have local address'
        it 'Should have country'
        it 'Should have state'
        it 'Should have city'
        it 'Should have contact number'
        it 'Should have date of birth'
        it 'Should have facebook'
        it 'Should have twitter handle'
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
