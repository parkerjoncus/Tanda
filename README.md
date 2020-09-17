# TandaHQ Challenges
## Adnat (Ruby on Rails challenge)
### Property of Parker Joncus 9/17/2020

### Summary
I attempted this challenge for a job prospect. This was the first time I used Ruby on Rails, so it was a bit of a learning curve for me. The application is not perfect, but it gets the job done.

### Known issues
1. The database structure is not correct. I have the organizations belonging to the user rather than the user belonging to the organizations. This is mainly because I started by creating the user in order to create the login. When I attempted to restart and start with the organization, I would get errors that a new user had to have an organization even though I was allowing it to be null. When I looked into this further, it seemed as though it was a problem with SQLite3 and I was not able to find a work around. 
2. When logging in, there is a middle page that just says you logged in. This was because the login button was routing to the home index page when I was wanting it to go to the user index page. My workaround was to create the hom eindex page to say success and have a next button link. This is terrible user interface design, but at the time I was more concerned with getting the program to work. 
3. When logged in as a user without being part of an organization, you have the option of editing an existing organization or joining one. If you join one, then great, you are now part of that organization. The problem is that the organization is only letting one user be a part of it at a time, so the user that was on the organization before will be kicked out. I am pretty sure this was due to the database issue address in #1. Since the organization belongs to the user in this application, it just seems to get reassigned. 
4. The main user page where you either can select an organization or see the organization you belong to has a back link. This link takes you to all the users where you can view, edit, and delete any or all users. This is obviously impracticle for user design, but it was my way of quickly testing different users and organizations. 
5. If you try to destroy a user with an organization on the page mentioned in #4, it will fail. THis is probably due to missing destroy logic in the user for the organization. 
6. There is no validation on the email to make sure that the email actually is a proper format. 
7. There is no forgot password option on the login page. This was mostly due to that it seemed unneccessary to make a page that just has you enter the email and then says something like "an emial has been sent to reset", but no email would really be sent.
8. If you are part of an organization, it will print the organization name, but the page also has some weird printing that gives all the organization info in an array. I am not sure why this does this because I have printed the organization info before. It is somthing to do with the whole <%= @user.organizations do |organization| %> <% end %>, but not sure what. 
9. If you are part of an organization, you cannot use the leave button to leave it. I have not really looked into this yet and I still might try to figure it out. It was not as high a priority to me. 
10. Not as much of an issue, but I changed the entry fields for date and time to select. This just made it easier in my mind as validation would not be necessary. 
11. The time is in UTC time, but as far as anyone can tell, it does not matter. It would only matter if this application was distriuted over multiple time zones. 
12. You can have negative hours. This just seemed funny to me since you can then have negative pay, so I decided to leave it. 
13. The start and finish time is in 24 hour rather than 12 hour. I did not really see much of a problem with this until I accidentally said I worked from 7-4 and it came out negative. 
14. Sometimes the create shift button does not want to work. It will do nothing. I just refresh and then it is fine. 
15. The shift chart is not based on the organization. I instead just printed every users shift. I did this becuase of the issues in #1 and #3. Since only one user could be in one organization it seemed ridicuous to print every user in a single organization since it would just be the one user. If #1 and #3 were fixed, this would not be hard to fix.
16. Users can create duplicate organizations. They can be duplicated if the name is the same and if both the name and hourly rate is the same. 
17. You can quickly add a new user on the all users page. Again this was more fore quick testing purposes. 

If there are any other issues that I missed please let me know!
 
 ### Resources
 Getting Started with rails. This was a good place for me to start and quickly learn ruby on rails. https://guides.rubyonrails.org/getting_started.html
 
 Authentication from Scratch. This really helped me with the whole login and password verification. This guide takes you through a lot of built in rails functionality to make loging in and out much easier.  https://medium.com/@wintermeyer/authentication-from-scratch-with-rails-5-2-92d8676f6836
