class ChangeColumnNames < ActiveRecord::Migration[5.0]
  def change
    rename_column :schedules, :end, :end_time
    rename_column :schedules, :start, :start_time
  end
end
