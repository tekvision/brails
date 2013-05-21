require 'spec_helper'

describe LevelsController do
  before do
    @user = create(:user)
    sign_in :user, @user
  end

  it 'Should display the index' do
    level = create(:level)
    get :index
    should respond_with(:success)
    level.should_not be_nil
  end

  it 'Should show number of cookies for the level' do
    topic = create(:topic)
    topic1 = create			(:topic)
    level_cookies = topic.cookies + topic1.cookies
    level_cookies.should_not be_nil
  end
end
