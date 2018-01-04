class AddLatitudeAndLongitudeToMember < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :latitude, :float
    add_column :members, :longitude, :float
  end
end
