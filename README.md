# KSPC Aesthetics/Archive

Our website provides the user with information on events related to KSPC, the online radio station centered at Pomona College. In particular, we updated the website from its previous version to add more information about the history of the station and make the website compatible with the archived framework, which will host a large amount of audio, video and image files that are easily searchable and intuitive to upload. Users can browse the website to listen to past recordings, see upcoming broadcasts and events, and also learn the history of the station from the archived files.  

## Installation

Install imagemagick:
`brew install imagemagick`

Ensure you have MySQL server running and ImageMagik on your machine. Now run the following commands:

If you get a socket error it is probable the MySQL server is not running.

`bundle install`

To create the database:
`rake db:reset`

`rails s `

Troubleshooting:

1. Mac Users only: MySQL install reference https://gist.github.com/nrollr/a8d156206fa1e53c6cd6 ImageMagik install reference http://stackoverflow.com/questions/7053996/how-do-i-install-imagemagick-with-homebrew

2. The MySQL socket path is found in config/database.yml and defaults to /tmp/mysql.sock .  If you are getting a socket error with MySQL running check the socket path in /etc/mysql/my.cnf and edit the socket path in config/database.yml if necessary.  

3. If you get an error message regarding secret_key_base you can generate the secret with ```rake secret``` and export it to config/secrets.yml with the format

```
development:
  secret_key_base: <secret_here>
```

## Usage

Once on the website, you may create an admin account under localhost:3000/admin. Login and begin editing content with the different green buttons enabled on the admin view. These buttons are on the about, expo, blog, archive, and contact tabs. See our changelog in History for additional details and screenshots.

## Known Limitations

- Not all content is editable. For example, the homepage banner photo and the website footer are static. However, every other tab should have editing features.
- Blog searching and organizing interface is imeplemented without backend support, so there is no functionality in the blog side bar.
- Whenever we push a new site version to Heroku, we lose media that was uploaded to the previous live version. We have not found a solution for this problem
- The WordPress migration does not adapt well to our project. We have made efforts to store kspc's old large image files externally among a couple solutions. The migration is still not ready for production.

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## History

### Tina, 4/17 - Dynamic Home Page, also it's hosted on the remote server (Heroku)! See here:

Changes:
execjs was causing compilation errors when deploying on Heroku. A quick fix (by disabling the uglifier) in production.rb was used.
program schedule URL has to be https:/ or it will not work. 

https://kspcdev.herokuapp.com/
Here's how to push your own changes onto the server (currently.) Eventually we'd want to make an account for Erica or Luke.

You can follow this tutorial: https://devcenter.heroku.com/articles/getting-started-with-rails4
The commands you need are: you install (brew install heroku) then you login (heroku login) with my credentials (tzhu@g.hmc.edu, password: message me on facebook for it). Then, you can run (heroku create) in the KSPC folder. Then we run (git push heroku master) to push
to heroku's remote server. Also, since we used mySQL you might need to do the commands:  https://devcenter.heroku.com/articles/cleardb under "Provisioning the add-on" to config it to use the ClearDb mySQL add-on.
Then, do (heroku run:detached rake db:migrate) see here: http://stackoverflow.com/questions/17237809/heroku-run-rake-dbmigrate-command-error . It should work then.
Note: Please alert others to be sure of your changes before pushing to remote server just in case.  

### Cha, 4/12 - Wordpress Migration
Please do the following to migate all blogs from wordpress
1. Run 'rake wordpress:import' When it works it will print a lot of stuff (all the contents) and migrate it to blogs.
2. The images are too large to put on github, so I put in on Google drive link: https://drive.google.com/open?id=0B8CcBOaEIxGHZjNKc210eU1yalU
Put this folder in 'public/' Most pictures are in this folder, but some old ones use pic hosting service and may or may not be expired.


### Judy, 3/25 - Blog & contact/email page controller
Blog editing, updating, deleting implemented. Formatting and Disqus comment feature finished for individual blog showings. Later, the blog front page will look nice too. Admin under kspc.auto@gmail.com can monitor comments.
![screen shot 2017-03-25 at 4 13 07 pm](https://cloud.githubusercontent.com/assets/5604374/24326872/f5ef4f10-1175-11e7-8246-b8cf4f097362.png)

I've also added functionality and content editing to the contact page. All messages will go to kspc.auto@gmail.com as Cha set up.

Lastly, I made TODO notes for the homepage and formatted the subscriber form to be consistent with our bootstrap theme.

### Cha, 3/19 - Sending emails after signing up
In the homepage the subscription email will be sent when someone signups.
The sender email is kspc.auto@gmail.com and can be changed to any appropriate ones.
The content is blank but we can change it to what the client prefers.

Sometimes you could get the "already exists database", which means we have to delete the old ones. This can be done by "rails c" and drop the table (can do this from mySql as well).

### Gus, 3/6 - Added admin account
The archives page needed an admin account to create new archives, so I created one that should work site wide. To log in, visit localhost:3000/admin and enter the credentials (message me for email/pass).

I made sure to disable registration so people can't create new admin accounts. I think the assumption is that there will be just one admin account shared between the people at KSPC.

Only thing that's a little off is that the real URL for the admin page is /mains/admin. Ideally we could find a way to get rid of that mains prefix everywhere. This is fine, but it means if you go to localhost:3000/admin it won't highlight the proper tab you are on. Also added a TODO to move the admin nav buttons to the right to separate them from the rest.

### Judy, 3/6 - Made content editable
The About and Expo pages contain general info, but we do not want that info to be static. Now you can use a rich text editor (tinymce used by Evernote, LinkedIn, WordPress, and more) to edit the content through our front-end. Admin privileges will be added later.
![screen 3/5](https://cloud.githubusercontent.com/assets/5604374/23595793/8c201926-01d9-11e7-8c11-b9ab6fd9d82a.png)

### Cha, 3/5 - Add contact page and fix homepage
Fix homepage to work with bootstrap 4 format, and create new database for contact page.

### Gus, 2/25 - Created archive controller/model
The archive page now has it's own controller for the CSS, html, etc. It can now be developed somewhat independently of the rest of the page. To accompany this new controller, I also created a new model (like a class) for an archive. This model has a title field and a file attachment via PaperClip. Currently it just supports images, but other file types can be added via archive.rb. Most of the code for the archive page currently resides in archives/new.html.erb, archives/index.html.erb, archive.rb, and archives_controller.rb

## Credits

Website developed by [Judy Lin](https://github.com/jurdz), [Eric Nguyen](https://github.com/shiftswitchy), [Natchanon Suaysom](https://github.com/nsuaysom), and [Christina Zhu](https://github.com/zhutineer).

Archive developed by [Gus Callaway](https://github.com/gustebeast), [Matthew Gee](https://github.com/0ffkilter), [Daniel Sonner](https://github.com/danielsonner), and [Reiko Tojo](https://github.com/hmc-cs-rtojo).

With help from several guides including:
- Ruby on Rails: http://guides.rubyonrails.org/
- Bootstrap: https://github.com/twbs/bootstrap-rubygem
- MySQL: https://rubygems.org/gems/mysql/versions/2.9.1
- Tinymce Gem/Plugin: https://github.com/spohlenz/tinymce-rails, https://www.tinymce.com/docs/
- Paperclip Gem: https://github.com/thoughtbot/paperclip
- Devise Gem: https://github.com/plataformatec/devise
- Disqus Plugin: https://disqus.com/api/docs/
- Spinitron Plugin: https://spinitron.com/doc/special-topics/web-integration/
- Twitter Plugin: https://dev.twitter.com/web/overview

## License

MIT License

Copyright (c) 2017 KSPC

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
