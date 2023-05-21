Hi,

Here in this school management project there are 3 types of user authentication via devise
and for roles based data I have separated/scoped MVC for each so that atomicity can be maintained

For given model
for Admin there is integration with RailsAdmin gem

For school admin
  they can create batches and then add courses in them
  see reuqested enrollments and approve/reject them
  
for Students 
  they can see all the schools
                       batches per school
                       and request to enroll in them
                       once approved they can see other students aswell with their progress
                       
