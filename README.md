# Fit Fight

This app allows you compete with your friends using FitBit data to see who worked out harder. Users must have a FitBit and authorize the app to access their FitBit data through the FitBit API in order to use this app.

A user creates and account by authorizing the app with FitBit and then signing in with the app. They can then challenge other users to see who had more steps, went a further distance, or had more active time in a day. A user is awarded a point in each of these categories if she has more than her challenger. The challenger gets points for beating the user. At the end of the challenge period, the winner is the person with more points.

### Setup

You must first have a FitBit acccount to access this app. If you do not have one, navigate to www.fitbit.com and create one.

We have no percent test coverage, and the tests will not pass due to database changes that have been made. Feel free to figure out the issue and fix it for us. 

You must have an token and secret as a developer with the FitBit API in order to query data from them. Then you can run this using Rails 4. Environment variables are already set, so there is no need to set them.

Launch rails server, navigate to your local host and sign in with your fitbit account. 

There is no sync method with the FitBit gem, so there is no way to update your stats without some kind of seed file that creates users, daily workouts and challenges.

### Dependencies

This app is dependent on Fitgem, a ruby gem designed to make interacting with the FitBit API easy. It is also dependent on OmniAuth.


Good luck.
