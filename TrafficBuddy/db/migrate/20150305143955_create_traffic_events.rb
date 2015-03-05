class CreateTrafficEvents < ActiveRecord::Migration
  def change
    create_table :traffic_events do |t|
      t.text  :title
      t.time  :updatetime
      # create new model or fields?
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
