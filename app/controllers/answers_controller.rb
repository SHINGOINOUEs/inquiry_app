class AnswersController < ApplicationController
  before_action :set_question, only: [:create, :edit, :update, :destroy]  

  def create
    @answer = @question.answers.build(answer_params)
    @answer.user = current_user
    if @answer.save
      redirect_to @question, notice: "回答を投稿しました。"
    else
      render :new
    end

  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update(answer_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to @question
  end

  private

  def set_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:content, :user_id)
  end

end
