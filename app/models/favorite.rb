class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :question
  belongs_to :answer, optional: true

  validates_uniqueness_of :question_id, scope: :user_id
end
