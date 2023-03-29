class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! 

  def index
    @questions = Question.all.includes(:user)

    @q = Question.ransack(params[:q])
    @questions = @q.result(distinct: true)
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.includes(:user)
    @answer = Answer.new
    @current_user = current_user    
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      redirect_to @question, notice: "質問を投稿しました。"
    else
      render :new
    end
  end


  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end  

  def question_params
    params.require(:question).permit(:category_id, :title, :content)
  end  

end
