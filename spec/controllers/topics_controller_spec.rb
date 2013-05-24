require 'spec_helper'

describe TopicsController do
  before do
@topic = create(:topic)
    end

  it 'Should show the topic' do
    get :show, id: @topic.id
    respond_with(:success)
    @topic.should_not be_nil
  end

  it 'Should render associated content' do
    pending
  end

  it 'Should show summary' do
    @topic.summary.should_not be_nil
    end

  context "When topic ends" do
    it 'Should show an exercise'
  end

 end
