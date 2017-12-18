class CreateBasicDataModels < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :uuid, null: false, unique: true
      t.string :postcode, null: false
      t.timestamps
    end

    create_table :submissions do |t|
      t.integer :member_id, null: false
      t.string :uuid, null: false, unique: true
      t.text :involvement
      t.integer :distance
      t.string :distance_mode
      t.boolean :this_1
      t.string :feelings_1
      t.boolean :finished, default: false
      t.timestamps
    end
  end
end
