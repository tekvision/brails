require 'spec_helper'

describe CommentsController do
  
  context 'create comment' do
     it 'should redirects to new page'
     it 'should give an comment'
     it 'should redirects to index page after creating comment'
  end

  context 'edit comment' do
     it 'should redirects to new page'
     it 'should edit comment'
     it 'should redirects to index page after editing'
  end

  context 'delete comment' do
        it 'should generate alert box'
	it 'should confirm message'
	it 'should have ok and cancel buttons'
	it 'should not delete after clicking cancel button'
	it 'should delete after clicking on ok button'
        it 'should redirects to index page after deleting comment'
  end
end
 