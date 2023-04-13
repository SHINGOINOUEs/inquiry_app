class Answer < ApplicationRecord
  belongs_to :question

  has_many :useful_answers
  has_many :users, through: :useful_answers
  has_many :questions, through: :useful_answers
  
end
