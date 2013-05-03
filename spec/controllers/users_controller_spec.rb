require 'spec_helper'

describe UsersController do

  context 'role as a Guest' do
    it 'should see home page after visiting to the site'
    it 'should invite user'
  end


  context 'role as a Student' do
    it 'should see the list of storyBoard'
    it 'should choose the storyBoard'
    it 'should redirected to storyBoardPage after logged in'
    context 'if Beginner Student' do
      it 'should starts from basics'
    end

    it 'if Intermediate Student'
    it 'should starts from anywhere'
  end

  context 'if Advance Student' do
    it 'should skip the basic part and starts form advance concepts'
  end

  context 'role as a Admin' do
    before do
      it 'should logged in'
    end

    it 'should redirected to storyBoardPage after logged in'
    it 'should able to answer the queries'
  end
end
