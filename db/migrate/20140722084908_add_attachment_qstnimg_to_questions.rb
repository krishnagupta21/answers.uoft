class AddAttachmentQstnimgToQuestions < ActiveRecord::Migration
  def self.up
    change_table :questions do |t|
      t.attachment :qstnimg
    end
  end

  def self.down
    remove_attachment :questions, :qstnimg
  end
end
