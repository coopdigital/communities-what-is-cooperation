class AddActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :name, null: false, unique: true
      t.boolean :active, default: true
      t.timestamps
    end

    create_table :interests do |t|
      t.integer :submission_id, null: false
      t.integer :activity_id, null: false
      t.integer :position, null: false
    end

    add_foreign_key :activities, :interests
    add_foreign_key :activities, :submissions
  end
end
