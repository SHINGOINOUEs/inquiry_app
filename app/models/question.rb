class Question < ApplicationRecord
  belongs_to :category
  belongs_to :user 
  belongs_to :status, optional: true  
  has_many :answers, dependent: :destroy  
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
  validates :title, presence: true
  validates :content, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[title content]
  end

  def favorited?(user)
    favorites.find_by(user_id: user.id).present?
  end

  # def user_name
  #   user.name
  # end

end
