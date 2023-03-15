class Question < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true
  validates :status, inclusion: { in: [true, false] }     
end
