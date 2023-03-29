class UsefulAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :answer
  
  validates :user_id, presence: true
  validates :answer_id, presence: true
  validates_uniqueness_of :answer_id, scope: :user_id

end
