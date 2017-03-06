# README

### kspc.org
Migrating to Ruby on Rails

# Changelog

### Cha, 3/5 - Add contact page and fix homepage
Fix homepage to work with bootstrap 4 format, and create new database for contact page. 

Changes that may cause errors

1. 'secrets.yml' is not pushed (in gitignore) so if the error about 'secretkey in development ... missing' please add the file back in the local repo.

2. In 'database.yml' some of us have different socket path to mysql. I've seen that it will be one of the two '/var/run/mysqld/mysqld.sock' or '/tmp/mysql.sock' please change them accordingly if you get an error about 'socket path <PATHNAME> ... not found'. Also please don't set 
password in mysql, but if it has been set change it back to empty string.

3. 'rake db:migrate' or 'rake db:create' may need to be run if there is an error like 'database <DATABASE_NAME> not found'. 


### Gus, 2/25 - Created archive controller/model
The archive page now has it's own controller for the CSS, html, etc. It can now be developed somewhat independently of the rest of the page. To accompany this new controller, I also created a new model (like a class) for an archive. This model has a title field and a file attachment via PaperClip. Currently it just supports images, but other file types can be added via archive.rb. Most of the code for the archive page currently resides in archives/new.html.erb, archives/index.html.erb, archive.rb, and archives_controller.rb


