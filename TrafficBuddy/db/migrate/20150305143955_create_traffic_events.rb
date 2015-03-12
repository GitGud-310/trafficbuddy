class CreateTrafficEvents < ActiveRecord::Migration
  def change
    create_table :traffic_events do |t|
      t.string  :title
      t.text  :content
      t.time  :updatetime
      t.timestamps
    end
  end
end
