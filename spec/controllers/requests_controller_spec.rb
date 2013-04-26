require 'spec_helper'

describe RequestsController do

 context 'create request' do
     it 'should redirects to new page after clicking on create button'
     it 'admin & student can create request'
     it 'redirects to index page after creating request'
 end

 context 'edit request' do
     it 'should redirects to edit page'
     it 'should edit request only who has created'
     it 'should redirects to index page after editing the request'
 end

 context 'delete request' do
        it 'admin should delete the request'
        it 'should generate alert box'
	it 'should confirm message'
	it 'should have ok and cancel buttons'
	it 'should not delete after clicking cancel button'
	it 'should delete after clicking on ok button'
        it 'should redirects to index page after deleting request'
 end
end
