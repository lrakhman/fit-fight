class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
    	t.references :user
    	t.date :start_date
    	t.date :end_date
    	t.references :winner
    	t.references :challenger

      t.timestamps
    end
  end
end
