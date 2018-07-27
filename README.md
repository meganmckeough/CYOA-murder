# Choose Your Own Murder Mystery
## Will you survive the night?

[Take a shot, Detective!](https://murder-mystery.herokuapp.com/)

### The story
Enter the mansion and let your decisions take you on a journey... though you may not make it out alive! You play the story as one of four types of detective (further functionality with characters coming soon!). Try not to use the Back button. If you perish you can replay the story and discover one of the other many endings. Add your name and ending to the Leaderboard after each time you complete the story! 
Written by me, and there are further stories are coming soon. 

### The website
This full-stack web app was made as the second project for the General Assembly Web Development Immersive course. The story is very simple as the app is designed to utilise relational databases and focus on the code - but more complex / interesting stories are hopefully in the pipeline! 

### The code
Made with SQL, Ruby, HTML5, CSS3, and Javascript.
Gems used: sinatra, activerecord, pg, and bcrypt.
Big thanks to [Twine](http://twinery.org/) - which made the story planning process amazingly easy!

### The process
* Story planned and written using Twine, which helped with laying out the story logic and options.
* For each segment there can be between 1 and 3 possible options for the user the choose. Each decision decides their narrative through the story.
* A postgreSQL database was used to store story segments (with story logic and options), characters created by users, scores, users and endings. Story segments are pulled from the database and displayed based on the option that is picked by the user on the previous story segment.
* There are 9 possible endings, and a summary of the ending is displayed along with the user and character name on a leaderboard upon completion. Endings are also stored in a table, and on each completion a new record is added to the table for scores.

### Coming soon
Tidying up layout for mobile and other devices; adding additional stories and functionality that utilises the character chosen. Taking requests for any particular types of stories!