class AddFieldsToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :category, :string
    add_column :questions, :course, :string
    add_column :questions, :year, :integer
    add_column :questions, :testname, :string
    add_column :questions, :qno, :integer
    add_column :questions, :subpartcheckbox, :string
    add_column :questions, :subpart, :integer
  end
end
