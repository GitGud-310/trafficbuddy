class CreatePlannedTrips < ActiveRecord::Migration
  def change
    create_table :planned_trips do |t|
      t.string :start_loc
      t.string :end_loc
      t.decimal :start_lat, :precision => 15, :scale => 10, :default => 0.0
      t.decimal :start_lon, :precision => 15, :scale => 10, :default => 0.0
      t.decimal :end_lat, :precision => 15, :scale => 10, :default => 0.0
      t.decimal :end_lon, :precision => 15, :scale => 10, :default => 0.0
      t.datetime :created_at
      t.datetime :updated_at
      t.belongs_to :user, index:true

      t.timestamps
    end
  end
end
