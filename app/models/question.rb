class Question < ApplicationRecord
  has_many :answers
  belongs_to :user

  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user  

  has_many :useful_answers
  has_many :users, through: :useful_answers
  has_many :answers, through: :useful_answers    

  def self.ransackable_attributes(auth_object = nil)
    %w[title content]
  end

end
