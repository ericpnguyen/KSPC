namespace :wordpress do
  desc "Import WordPress data"
  task :import => [ :environment ] do
    # Get the WordPress data
    data = WordPress::Data.new
    data.posts.each do |data|
      print "The title is \n"
      print data.title
      print "\n"
      print "The content is \n"
      print data.content
      print "\n"
      print "The author is \n"
      print data.author
      print "\n"
      print "The pubdate is \n"
      print data.pubdate
      print "\n"
      blog = Blog.new
      blog.title = data.title
      blog.content = data.content
      blog.author = data.author
      #blog.created_at = data.pubdate
      blog.save!
    end
  end
end