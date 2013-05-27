require 'spec_helper'

describe QuestionsController do
  before do
    @question = create(:question)
    end

  it 'Should show questions serially' do
    # There will be a link for each question
    questions = ["1" => @question, "2" => @question}
    questions["1"].should_not be_nil
    question["2"].should_not be_nil
  end

  it 'Should reduce cookies on attempts' do
    question = build(:question)
    question.options << build(:option, :question => question

  end

end
