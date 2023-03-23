class FavoritesController < ApplicationController
  before_action :authenticate_user!


  def create
    @question = Question.find(params[:question_id])
    current_user.favorite_questions << @question
    redirect_to @question
  end

  def destroy
    @question = Favorite.find(params[:id]).question
    current_user.favorite_questions.delete(@question)
    redirect_to @question
  end

end
