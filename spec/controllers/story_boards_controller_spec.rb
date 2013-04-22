require 'spec_helper'

describe StoryBoardsController do

context 'listing story boards' do
   it 'should list out all the story boards' do

    it 'create story' do
       it 'should redirect to new page'
       it 'should redirect to index page after creating the story'
       it 'should display new record an index page'
    end

    it 'edit story' do
        it 'should redirect to edit page'
	it 'should redirect to index page after updating'
    end

    it 'delete story' do
	it 'should generate alert box'
	it 'should confirm message'
	it 'should ok and cancel button'
	it 'should not delete after clicking cancel button'
	it 'should delete after clicking ok button'
        it 'after redirects to index page'
    end
end

end
