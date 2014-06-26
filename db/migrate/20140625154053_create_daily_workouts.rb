class CreateDailyWorkouts < ActiveRecord::Migration
  def change
    create_table :daily_workouts do |t|
    	t.date :date
    	t.references :user
    	t.integer :steps
    	t.float :distance
    	t.integer :active_time

      t.timestamps
    end
  end
end
