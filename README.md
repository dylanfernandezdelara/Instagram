# Project 4 - Instagram

Instagram is a photo sharing app using Parse as its backend.

Time spent: 15 hours spent in total

## User Stories

The following **required** functionality is completed:

- [X] User can sign up to create a new account using Parse authentication
- [X] User can log in and log out of his or her account
- [X] The current signed in user is persisted across app restarts
- [X] User can take a photo, add a caption, and post it to "Instagram"
- [X] User can view the last 20 posts submitted to "Instagram"
- [X] User can pull to refresh the last 20 posts submitted to "Instagram"
- [X] User can tap a post to view post details, including timestamp and caption.

The following **optional** features are implemented:

- [X] Run your app on your phone and use the camera to take the photo
- [X] Show the username and creation time for each post
- [X] User can use a Tab Bar to switch between a Home Feed tab (all posts) and a Profile tab (only posts published by the current user)
- User Profiles:
  - [X] Allow the logged in user to add a profile photo

The following **additional** features are implemented:

- [X] Minimalist Dark Theme

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. Better ways to implement calls that update our backend
2. A cleaner way to reuse functions that only have minimal changes

## Video Walkthrough

![ezgif com-gif-maker (9)](https://user-images.githubusercontent.com/65196174/125145867-ca89e000-e0e8-11eb-8fa8-ba420993a209.gif)

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library


## Notes

Describe any challenges encountered while building the app.

This app built upon the skills used to make the Twitter app, but instead introduced managing a Parse backend. This meant using asynchronous data blocks to fetch information from our database using a query that we then used to populate our tableView cells. 

This project felt less technically challengening than the last and was mostly difficult due to time constraints. This week at FBU, we worked on this project, our self performance evaluation, and wireframes and schemas for our personal project. 

One major block I had during this assignment was using the PFImageView instead of a UIImageView. I updated my pod with ParseUI and included the header files, however my XCode was still not recognizing this data type. After uninstalling dependencies, reinstalling, and searching on stackoverflow/Github, I joined the support queue to see if a TA had any ideas. I worked with Priya for around 15 minutes trying to figure out what the problem was, but we could not find a solution. The next day I began looking at a possible solution of using a UIImageView and converting the PFFileObject to a UIImageView myself. After some digging, I found the use of an asynchronous call that saved the data in a format usable by UIImageView and this solved my problem.

Another block I had was fetching from my database, but only when the author matched the current PFUser. Our instructor Chris helped me with this solution by explaining that a parse query combines all of the set descriptors and then makes the call. This meant that I could request all the author data and then request only the keys that match the current PFUser. This will be extremely useful in my personal app once I implement specific user features. 

## License

    Copyright 2021 Dylan Fernandez de Lara

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
