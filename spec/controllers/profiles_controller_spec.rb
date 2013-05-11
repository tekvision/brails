require 'spec_helper'

describe ProfilesController do

    context 'create profile' do
       it 'should redirect to new page'
       it 'user should create new profile'
       it 'should redirect to index page after creating profile'
    end

    context 'edit profile' do
        it 'should redirect to edit page'
	it 'should edit profile'
	it 'should redirect to index page after updating profile'
    end

    context 'delete profile' do
	it 'should generate alert box'
	it 'should confirm message'
	it 'should have ok and cancel buttons'
	it 'should not delete after clicking cancel button'
	it 'should delete after clicking on ok button'
        it 'should redirects to index page after deleting'
    end
end
