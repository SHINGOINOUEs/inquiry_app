class Question < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :answers, dependent: :destroy  
  belongs_to :status, optional: true  
  validates :title, presence: true
  validates :content, presence: true


  def self.ransackable_attributes(auth_object = nil)
    %w[title content]
  end

end
