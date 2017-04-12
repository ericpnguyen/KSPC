module WordPress
  class Data
    attr_reader :doc
 
    def initialize
      @doc = Nokogiri::XML(File.open("wordpress.xml"))
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

    def pubdate
      @doc.xpath("pubDate").text
    end 

    def title
      @doc.xpath("title").text
    end

    def author
      @doc.xpath("author").text
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
