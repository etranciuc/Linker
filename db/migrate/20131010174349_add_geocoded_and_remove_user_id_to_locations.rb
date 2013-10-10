class AddGeocodedToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :geocoded, :boolean, default: false
    remove_column :locations, :user_id
  end
end
