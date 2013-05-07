require 'spec_helper'

describe StoryBoardsController do

  it 'should contain your intended topic or general idea'
  it 'should give rough idea of what your story is before you start'

  context 'listing story boards' do
    it 'should list out all the story boards'

    context 'create story' do
      it 'should redirect to new page'
      it 'should create new story'
      it 'should add contents'
      it 'should redirect to index page after creating the story'
      it 'should display new record an index page'
    end

    context 'edit story' do
      it 'should redirect to edit page'
      it 'should edit existing story'
      it 'should redirect to index page after updating'
    end

    context 'delete story' do
      it 'should generate alert box'
      it 'should confirm message'
      it 'should have ok and cancel buttons'
      it 'should not delete after clicking cancel button'
      it 'should delete after clicking on ok button'
      it 'should redirects to index page after deleting the story'
    end
  end
end
