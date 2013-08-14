module LevelsHelper

  def calculate_usercoins_bonusround(level)
    level.questions.inject(0) do |count, question|
      count + question.attempts.where(user_id: current_user.id).inject(0)do |count, attempt|
        count + attempt.coins
      end
    end
  end
  
  def calculate_totalcoins_bonusround(level)
    level.questions.inject(0) do |count, question|
      count + H_COOKIES[question.question_type] 
    end
  end

end 
