class AddStatusToQuestion < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :status, :boolean, null: false, default: false
  end
end
