class AddNewActivityFieldToSubmission < ActiveRecord::Migration[5.1]
  def change
    add_column :submissions, :activity_suggestion, :text
    remove_column :submissions, :this_1
  end
end
