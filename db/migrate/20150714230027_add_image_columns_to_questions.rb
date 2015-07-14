class AddImageColumnsToQuestions < ActiveRecord::Migration
  def self.up
    change_table :questions do |t|
      t.attachment :image_one
      t.attachment :image_two
    end
  end

  def self.down
    drop_attached_file :questions, :image_one
    drop_attached_file :questions, :image_two
  end
end
