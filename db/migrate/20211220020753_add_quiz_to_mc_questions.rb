class AddQuizToMcQuestions < ActiveRecord::Migration[6.1]
  def change
    add_reference :mc_questions,:quiz,foreign_key: true
  end
end
