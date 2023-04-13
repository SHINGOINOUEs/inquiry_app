class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable, :confirmable  
  has_many :questions
  has_many :favorites
  has_many :favorite_questions, through: :favorites, source: :question  

  has_many :useful_answers
  has_many :questions, through: :useful_answers
  has_many :answers, through: :useful_answers  

end
