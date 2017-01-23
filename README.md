# DBC-Project-Voter 

Welcome to DBC-Project-Voter! This Rails CRUD app lets current Dev Bootcamp students submit and vote on pitches for their final projects. 


## Current Features: 

### Admins

- Only Admins can designate other users as Admins. Otherwise, the default account will be Student.
- Only Admins can create a cohort (e.g. nyc-coyotes-2016, nyc-bobolinks-2016)
- In the Admin dashboard, Admins can see that a round of pitching has started and can decide when to it. 
- After pitching ends, Admins can create and start the first round of voting. 
- Admins can close the first round of voting, and see in their dashboard the pitches ranked from most to least.
- Because a student might have more than one pitch in the top 6, Admins can decide which top 6 pitches will move on to the second round of voting.
- Admins can create and start the second round of voting. Students will see this reflected in their Student dashboard. 
- Admins can end the second round of voting, and the results from the second round of voting will be displayd in their dashboard. 
- Admins can select the top 3 pitches for the cohort's final projects, with the pitch creator as the Team Lead. 

### Students 

- Students can only register for an account with a code (e.g. cohort-location-name-year)
- Students can login/logout 
- In the Student dashboard, Students can submit pitches once their cohort has been created. Students can only submit up to 5 pitches.  
- Students can see in their dashboard when a round of voting starts. They can vote for 7 pitches (including their own), where each vote in the first round carries the same weight (e.g. 1. point).
- Students can see in their dashboard when the second round of voting starts. They must rank the top 6 pitches. 


## TODO

- In addition to displaying the results from the second round of voting to the Admin, also create suggested teams for the top 3 pitches depending on who ranked what pitch and availability on each team.
- Display top three pitches for the Students in their dashboard.
- Due to time constraints (2.5 day project), we weren't able to implement a React front-end. The single-page view (Admin/Student) was achieved through the use of AJAX and jQuery, which is not where we would like it to be. Our next move would be to create an Rails API with a React front-end.


## Technologies:
- Rails 
- ActiveRecord
- PostgreSQL
- AJAX
- jQuery
- Pure.css 


## Contributors: 

- [Gregory Bilello](http://www.github.com/gvbilello)
- [Catherine Khuu](http://www.github.com/catkhuu)
- [Nan Nanutza](http://www.github.com/nanutza)
- [Zachary Rowden](http://www.github.com/regulus33)

 



