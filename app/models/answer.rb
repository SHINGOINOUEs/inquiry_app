class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  has_many :favorites, dependent: :destroy  
  has_many :useful_answer

  def useful?(user)
    useful_answers.exists?(user_id: user.id)
  end  

end
