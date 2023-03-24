class FavoritesController < ApplicationController
  before_action :authenticate_user!


  def create
    @question = Question.find(params[:question_id])
    favorite = current_user.favorite_questions.new(question: @question, answer: @question.answers.first.body)
    if favorite.save
      redirect_to @question, notice: 'Question was successfully favorited.'
    else
      # handle error
    end
  end

  def destroy
    @question = Favorite.find(params[:id]).question
    current_user.favorite_questions.delete(@question)
    redirect_to @question
  end

end
