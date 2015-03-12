class CreateLatLons < ActiveRecord::Migration
  def change
    create_table :lat_lons do |t|
      t.decimal  :latitude,  :precision => 15, :scale => 10, :default => 0.0
      t.decimal  :longitude, :precision => 15, :scale => 10, :default => 0.0
      t.belongs_to :traffic_event, index: true
      t.timestamps
    end
  end
end
