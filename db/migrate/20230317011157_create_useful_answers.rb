class CreateUsefulAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :useful_answers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :answer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
