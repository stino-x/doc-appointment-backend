class CreateAvailabilities < ActiveRecord::Migration[7.1]
  def change
    create_table :availabilities do |t|
      t.integer :day_of_week
      t.time :start_time
      t.time :end_time
      t.references :teacher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
