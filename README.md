# README

### kspc.org
Migrating to Ruby on Rails

# Changelog

### Cha, 3/19 - Sending emails after signing up.

In the homepage the subscription email will be sent when someone signups.
The sender email is kspc.auto@gmail.com and can be changed to any appropriate ones.
The content is blank but we can change it to what the client prefers.

### Gus, 3/6 - Added admin account
The archives page needed an admin account to create new archives, so I created one that should work site wide. To log in, visit localhost:3000/admin and enter the credentials (message me for email/pass).

I made sure to disable registration so people can't create new admin accounts. I think the assumption is that there will be just one admin account shared between the people at KSPC.

Only thing that's a little off is that the real URL for the admin page is /mains/admin. Ideally we could find a way to get rid of that mains prefix everywhere. This is fine, but it means if you go to localhost:3000/admin it won't highlight the proper tab you are on. Also added a TODO to move the admin nav buttons to the right to separate them from the rest.

### Judy, 3/6 - Made content editable
The About and Expo pages contain general info, but we do not want that info to be static. Now you can use a rich text editor (tinymce used by Evernote, LinkedIn, WordPress, and more) to edit the content through our front-end. Admin privileges will be added later.
![screen 3/5](https://cloud.githubusercontent.com/assets/5604374/23595793/8c201926-01d9-11e7-8c11-b9ab6fd9d82a.png)

Read Cha's update for solving errors. My change on master reverted #2 to work for mac. Windows developers need to change it back.

### Cha, 3/5 - Add contact page and fix homepage
Fix homepage to work with bootstrap 4 format, and create new database for contact page.

Changes that may cause errors

1. 'secrets.yml' is not pushed (in gitignore) so if the error about 'secretkey in development ... missing' please add the file back in the local repo.

2. In 'database.yml' some of us have different socket path to mysql. I've seen that it will be one of the two '/var/run/mysqld/mysqld.sock' or '/tmp/mysql.sock' please change them accordingly if you get an error about 'socket path <PATHNAME> ... not found'. Also please don't set
password in mysql, but if it has been set change it back to empty string.

3. 'rake db:migrate' or 'rake db:create' may need to be run if there is an error like 'database <DATABASE_NAME> not found'.

### Gus, 2/25 - Created archive controller/model
The archive page now has it's own controller for the CSS, html, etc. It can now be developed somewhat independently of the rest of the page. To accompany this new controller, I also created a new model (like a class) for an archive. This model has a title field and a file attachment via PaperClip. Currently it just supports images, but other file types can be added via archive.rb. Most of the code for the archive page currently resides in archives/new.html.erb, archives/index.html.erb, archive.rb, and archives_controller.rb
