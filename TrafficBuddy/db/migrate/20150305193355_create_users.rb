class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.decimal  :latitude,  :precision => 15, :scale => 10, :default => 0.0
      t.decimal  :longitude, :precision => 15, :scale => 10, :default => 0.0
      t.timestamps
    end
  end
end
