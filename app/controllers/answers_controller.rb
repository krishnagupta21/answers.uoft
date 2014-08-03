class AnswersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource 
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    @answer.user = current_user 
    if @answer.save
    @answer.create_activity :create, owner: current_user, recipient: @question.user
    redirect_to question_path(@question)  
    end
  
  end

   def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    redirect_to question_path(@question)
  end
 
 #def vote
  #value = params[:type] == "up" ? 1 : -1
  #@question = Question.find(params[:question_id])
  #@answer = @question.answers.find(params[:id])
  #@answer.add_or_update_evaluation(:votes, value, current_user)
  #redirect_to :back, notice: "Thank you for voting"
#end

def upvote
  @question = Question.find(params[:question_id])
  @answer = @question.answers.find(params[:id])
  @answer.liked_by current_user
  user = @answer.user
  user.increment(:score, 1) 
  user.save
  redirect_to @question
end

def downvote
  @question = Question.find(params[:question_id])
  @answer = @question.answers.find(params[:id])
  @answer.downvote_from current_user
  user = @answer.user
  user.decrement(:score, 1) 
  user.save
  redirect_to @question
end

  private
    def answer_params
      params.require(:answer).permit(:name, :body)
    end


end
