class DropFeelings < ActiveRecord::Migration[5.1]
  def change
    remove_column :submissions, :feelings_1
  end
end
