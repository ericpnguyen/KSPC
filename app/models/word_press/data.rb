module WordPress
  class Data
    attr_reader :doc
 
    def initialize
      @doc = Nokogiri::XML(File.open("wordpress.xml"))
      #print "Here1\n"
      #@doc.xpath("//title")
      #print title[0].to_s
      #print "Here2\n"
      
      #file = File.expand_path("wordpress.xml")
      #file = File.open(file)
      #@doc = File.open(file) { |f| Nokogiri::XML(f)}
      #doc  = Nokogiri::XML(file.read().gsub("\u0004", ""))
    end
    def posts
      doc.xpath("//item[wp:post_type = 'post']").collect do |post|
        WordPress::Post.new(post)
      end
    end

  end

  #end class data here

  class Post
    def initialize(doc)
      @doc = doc
    end

    def title
      @doc.xpath("title").text
    end

    def content
      @doc.xpath("content:encoded").text
    end
 
    def slug
      @doc.xpath("wp:post_name").text
    end

    def comments
      @doc.xpath("wp:comment").collect do |comment|
        Comment.new(comment)
      end
    end

  end

end
