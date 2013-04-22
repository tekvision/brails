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
  it 'should redirected to storyBoardPage after logged in'
end

context 'role as a Admin'
    before do
       it 'should logged in'
    end
   it 'should redirected to storyBoardPage after logged in'
   it 'should invite another admin'
end

end
