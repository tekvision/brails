require 'spec_helper'

describe LevelsController do
  before do
    @user = create(:user)
    sign_in :user, @user
  end

  it 'Should display the index' do
    level = create(:level)
    get :index
    render_template('home#index')
    should respond_with(:success)
    level.should_not be_nil
  end

  it 'Should show number of cookies for the level' do
    topic = create(:topic)
    topic1 = create			(:topic)
    level_cookies = topic.cookies + topic1.cookies
    level_cookies.should_not be_nil
  end

  context "When clicking on the level" do
    it 'Should show list of topics' do
      topic = create(:topic)
      topic1 = create(:topic)
      topic.title.should_not be_nil
      topic1.title.should_not be_nil
    end
  end

  context "When the level ends" do
    it 'Should un-lock the bonus round'
  end

end
