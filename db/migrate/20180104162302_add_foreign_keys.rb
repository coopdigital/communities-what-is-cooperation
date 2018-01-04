class AddForeignKeys < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :submissions, :members, on_delete: :cascade
    remove_foreign_key :interests, :submissions
    remove_foreign_key :interests, :activities
    add_foreign_key :interests, :submissions, on_delete: :cascade
    add_foreign_key :interests, :activities, on_delete: :cascade
  end
end
