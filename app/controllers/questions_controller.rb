class QuestionsController < ApplicationController
before_action :authenticate_user!, :except => [:show, :index]
load_and_authorize_resource except: :show
  def index
    # puts "======\n\n\n #{params}\n===="
    if params[:question]
       @questions = Question.search(params).order("created_at DESC") 
    else
      @questions = Question.all
    end


  end

  def new 
    @question = Question.new
  end

  def create
    @question = Question.create(question_params)
    @question.user = current_user
    if @question.save
      redirect_to :questions => :index
    else
      render 'new'
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
     @question.user = current_user
    @question.assign_attributes(question_params)
    if @question.save
      redirect_to @question
    end
  end

def destroy
    @question = Question.find(params[:id])
    if @question.destroy
      redirect_to questions_url
    end
end

def show
   @question = Question.find(params[:id])
end




  private
def question_params
    params.require(:question).permit(:name, :description, :qstnimg, :category, :course, :year, :testname, :qno, :subpart)
end
end
