class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :location
      t.date :date
      t.time :start_time

      t.timestamps null: false
    end
  end
end
