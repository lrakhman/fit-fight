class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
    	t.references :user
      t.integer :user_points
    	t.date :start_date
    	t.date :end_date
    	t.references :winner
    	t.references :challenger
      t.integer :challenger_points

      t.timestamps
    end
  end
end
