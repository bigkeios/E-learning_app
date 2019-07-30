class CreateQuestionAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :question_answers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.boolean :correct
      t. string :answer_user
      
      t.timestamps
    end
  end
end
