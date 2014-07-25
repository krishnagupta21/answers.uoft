class RemoveAnswerIdFromQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :answer_id, :integer
  end
end
