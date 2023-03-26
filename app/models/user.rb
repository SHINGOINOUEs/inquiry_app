class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable, :confirmable    
  has_many :questions
  has_many :favorites
  has_many :favorite_questions, through: :favorites, source: :question  

  def favorited?(question)
    favorites.exists?(question_id: question.id)
  end

  has_many :answers
  has_many :useful_answers, dependent: :destroy

end
