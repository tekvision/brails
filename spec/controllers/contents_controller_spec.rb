require 'spec_helper'

describe ContentsController do
  it 'Should render content sequentially' do
    content = create(:content)
    h_contents = {"1" => content, "2" => content}
    h_contents["1"].should_not be_nil
    h_contents["2"].should_not be_nil
  end

  context "When rendering the content" do
    it 'Should render text if type is text'
    it 'Should play an audio file if type is audio'
    it 'Should play video if type is video'
    it 'Should show an image if type is image'
    it 'Should render questions when requested'
  end
end
