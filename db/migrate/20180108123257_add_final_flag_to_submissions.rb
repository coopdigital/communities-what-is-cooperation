class AddFinalFlagToSubmissions < ActiveRecord::Migration[5.1]
  def change
    add_column :submissions, :final, :boolean, default: false
  end
end
