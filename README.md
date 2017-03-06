# README

### kspc.org
Migrating to Ruby on Rails

# Changelog

### Judy, 3/5 - Made content editable
The About and Expo pages contain general info, but we do not want that info to be static. Now you can use a rich text editor (tinymce used by Evernote, LinkedIn, WordPress, and more) to edit the content through our front-end. Admin privileges will be added later.
![screen 3/5](https://cloud.githubusercontent.com/assets/5604374/23595793/8c201926-01d9-11e7-8c11-b9ab6fd9d82a.png)

### Gus, 2/25 - Created archive controller/model
The archive page now has it's own controller for the CSS, html, etc. It can now be developed somewhat independently of the rest of the page. To accompany this new controller, I also created a new model (like a class) for an archive. This model has a title field and a file attachment via PaperClip. Currently it just supports images, but other file types can be added via archive.rb. Most of the code for the archive page currently resides in archives/new.html.erb, archives/index.html.erb, archive.rb, and archives_controller.rb
