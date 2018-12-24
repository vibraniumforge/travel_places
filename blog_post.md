My blog post for my Travel Places app.

The instruction was to create a Content Management System for something we like. I love to travel. So I decided that would be my project topic.

It allows a user to track the locations of places that they have been to. A place is catalogued and contains info about which continent it is on, which country, which state, and the city name. There is also a notes category, where the user can enter notes about the trip or other information.

One really hard part of this was adding the flash messages. The documentation for the Sinatra Flash gem is really weak. It didn't really match what I have in my project. It has an app.rb, which we have not used in our labs for a while. It also sort of matched the flash gem from the Playlister app, but it didn't. I was close enough that I was really confused. But after a lot of trial and error, I got it to work.

One good idea I had was to put many of the links, and a greeting for the user in the layout.erb. That way t would be automatically added on every .erb view. So it would remain consistent across the 7 views that I have. I also added the message from the flash here. So the looks across the pages are consistent and I saved a lot of copy and paste coding. "DRY" - don't repeat yourself!!

This app has multiple users. In the future, I could build out several features. Have the ability for a user to see how many people went to Paris for example. Maybe I would make the Notes more like a review. It would belong to a user, but the city name and location might be independent of a user. Or a user could search by Ile de France, the state Paris is in, but NOT Paris. The user could use this info to make weekend trips nearby. 
