class CreateBookmarkedLocations < ActiveRecord::Migration
  def change
    create_table :bookmarked_locations do |t|
      t.string :name
      t.decimal  :latitude,  :precision => 15, :scale => 10, :default => 0.0
      t.decimal  :longitude, :precision => 15, :scale => 10, :default => 0.0
      t.belongs_to :user, index:true
      t.timestamps
    end
  end
end
