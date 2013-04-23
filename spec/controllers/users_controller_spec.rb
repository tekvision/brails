require 'spec_helper'

describe UsersController do

context 'role as a Guest' do
  it 'should see home page after visiting to the site'
  it 'should invite user'
end


context 'role as a Student'
   before do
      it 'should logged in'
   end
   it 'should see the list of storyBoard'
   it 'should choose the storyBoard'
   it 'should redirected to storyBoardPage after logged in'
   it 'should be an Beginner student' do
       it 'should starts from basics'
   end
   it 'should be an Advanced student' do
       it 'should skip the basic part and starts form advance concepts'
   end
end

context 'role as a Admin'
    before do
       it 'should logged in'
    end
    it 'should keep the details of login Student'
    it 'should redirected to storyBoardPage after logged in'
    it 'should keeps an account of documentation details & maintain information'
    it 'should manage administration role & provide support'
    it 'should conduct performance review of student'
    it 'should make standard work schedule'
    it 'should able to answer the queries'
    it 'should conduct the tests'
    it 'should provide certificate after conducting tests'
  end
end
