require 'spec_helper'

describe Topic do
  context 'fields' do
    it 'should have topic number'
    it 'should have title'
    it 'should have sub topic'
  end

  context 'required fields' do
    it 'should have topic number'
    it 'should have title'
  end

  context 'associations' do
    it 'should have one content'
    it 'Should belongs to story'
  end

end
