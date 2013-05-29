require 'spec_helper'

describe UsersController do
  context "When user is not logged-in" do
    it 'Should redirect to home page'
      Should redirect_to home_path
    end
  end

  context 'role as a Guest' do
    it 'should see home page after visiting to the site'
    it 'should invite user'
  end

context 'role as a Student' do
   before do
      it 'should register'
      it 'should logged in'
   end
   it 'should redirected to storyBoardPage after logged in'
   it 'should see the list of storyBoard'
   it 'should choose the storyBoard'
   it 'if Beginner student' do
       it 'should starts from basics'
       it 'should redirect to basic storyboard after clicking on it'
   end
   it 'if an Advanced student' do
       it 'should skip the basic part and starts from advance concepts'
       it 'should redirect to advance storyboard after clicking on it'
   end
end

    it 'if Intermediate Student'
    it 'should starts from anywhere'
  end

  context 'if Advance Student' do
    it 'should skip the basic part and starts form advance concepts'
  end

  context 'role as a Admin' do
    before do
       it 'should register as an admin'
       it 'should logged in'
    end
    it 'should redirected to storyBoardPage after logged in'
    it 'should manage administration role & provide support'
    it 'should redirected to storyBoardPage after logged in'
    it 'should able to answer the queries'
  end

end
