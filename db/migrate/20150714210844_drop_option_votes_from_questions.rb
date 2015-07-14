class DropOptionVotesFromQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :option_one_votes
    remove_column :questions, :option_two_votes
  end
end
