class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.references :show, foreign_key: true
      t.references :channel, foreign_key: true
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
