require 'spec_helper'

describe Topic do
  context 'fields' do
    it 'should have title'
    it 'Should have cookies'
    it 'Should have summary'
  end

  context 'required fields' do
    it 'should have title'
    it 'Should have cookies'
    it 'Should have summary'
  end

  context 'associations' do
    it 'Should belongs_to level'
    it 'should have many contents'
    it 'Should have many questions'
  end

end
