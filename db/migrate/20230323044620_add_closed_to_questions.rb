class AddClosedToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :closed, :boolean
  end
end
