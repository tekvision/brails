require 'spec_helper'

describe TopicsController do

 context 'create topic' do
    it 'should redirect to new page'
    it 'should create new topic'
    it 'should redirect to index page after creating the topic'
 end

 context 'edit topic' do
    it 'should redirect to edit page'
    it 'should edit existing topic'
    it 'should redirect to index page after updating'
 end

 context 'delete topic' do
	it 'should generate alert box'
	it 'should confirm message'
	it 'should have ok and cancel buttons'
	it 'should not delete after clicking cancel button'
	it 'should delete after clicking on ok button'
        it 'should redirects to index page after deleting'
  end
 end
