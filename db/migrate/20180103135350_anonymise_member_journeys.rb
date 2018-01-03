class AnonymiseMemberJourneys < ActiveRecord::Migration[5.1]

  def up
    change_column :members, :postcode, :string, null: true
    add_column :members, :source, :string, default: 'admin', null: false
  end

  def down
    change_column :members, :postcode, :string, null: false
    remove_column :members, :source
  end

end
