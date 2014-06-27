# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(fullname: "Mikee Pourhadi", email: "mikeepourhadi1@gmail.com")
User.create(fullname: "Peter Debelak", email: "petersmells@gmail.com")
User.create(fullname: "Steve Yim", email: "steve@gmail.com")

DailyWorkout.create(date: "2014-04-08", user_id: 4, steps: 2000, distance: 2, active_time: 40)
DailyWorkout.create(date: "2014-04-09", user_id: 4, steps: 3000, distance: 3, active_time: 20)
DailyWorkout.create(date: "2014-04-09", user_id: 2, steps: 2000, distance: 2, active_time: 40)
DailyWorkout.create(date: "2014-04-08", user_id: 2, steps: 3000, distance: 4, active_time: 31)
DailyWorkout.create(date: "2014-04-08", user_id: 3, steps: 3000, distance: 4, active_time: 31)
DailyWorkout.create(date: "2014-04-08", user_id: 3, steps: 3000, distance: 4, active_time: 31)
DailyWorkout.create(date: "2014-04-10", user_id: 4, steps: 3000, distance: 4, active_time: 31)
DailyWorkout.create(date: "2014-04-11", user_id: 4, steps: 3000, distance: 4, active_time: 31)
DailyWorkout.create(date: "2014-04-12", user_id: 4, steps: 3000, distance: 4, active_time: 31)

DailyWorkout.create(date: "2014-06-26", user_id: 4, steps: 3000, distance: 4, active_time: 31)
DailyWorkout.create(date: "2014-06-27", user_id: 4, steps: 3000, distance: 4, active_time: 31)
DailyWorkout.create(date: "2014-06-28", user_id: 4, steps: 3000, distance: 4, active_time: 31)

DailyWorkout.create(date: "2014-06-26", user_id: 1, steps: 3000, distance: 4, active_time: 31)
DailyWorkout.create(date: "2014-06-27", user_id: 2, steps: 3000, distance: 4, active_time: 31)
DailyWorkout.create(date: "2014-06-28", user_id: 3, steps: 3000, distance: 4, active_time: 31)

Challenge.create(user_id: 4, start_date: "2014-04-08", end_date: "2014-04-09", challenger_id: 2)
Challenge.create(user_id: 2, start_date: "2014-04-08", end_date: "2014-04-09", challenger_id: 3)
Challenge.create(user_id: 4, start_date: "2014-04-10", end_date: "2014-04-11", challenger_id: 3)
Challenge.create(user_id: 4, start_date: "2014-06-25", end_date: "2014-06-30", challenger_id: 3)