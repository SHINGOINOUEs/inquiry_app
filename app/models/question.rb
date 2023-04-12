class Question < ApplicationRecord
  has_many :answers
  belongs_to :user  

  def self.ransackable_attributes(auth_object = nil)
    %w[title content]
  end

end
