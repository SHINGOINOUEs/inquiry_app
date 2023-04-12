class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :question  
  belongs_to :answer
  validates_uniqueness_of :question_id, scope: :user_id  
  validates :answer_id, presence: true
end
