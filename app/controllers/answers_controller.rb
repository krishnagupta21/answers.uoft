class AnswersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource 
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
     @answer.user = current_user 
     if @answer.save
    redirect_to question_path(@question)
    end
  end

   def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    redirect_to question_path(@question)
  end
 
  private
    def answer_params
      params.require(:answer).permit(:name, :body)
    end


end
