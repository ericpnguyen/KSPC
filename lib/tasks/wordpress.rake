namespace :wordpress do
  desc "Import WordPress data"
  task :import => [ :environment ] do
    # Get the WordPress data
    data = WordPress::Data.new
    print "Hello World\n"
    data.posts.take(20).each do |data|
      print data.title
      print "\n"
      print data.content
      print "\n"
    end
  end
end