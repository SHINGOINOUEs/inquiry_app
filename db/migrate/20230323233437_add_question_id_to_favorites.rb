class AddQuestionIdToFavorites < ActiveRecord::Migration[6.1]
  def change
    add_reference :favorites, :question, null: false, foreign_key: true
  end
end
