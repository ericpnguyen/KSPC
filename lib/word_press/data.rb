module WordPress
  class Data
	attr_reader :doc
	def initialize
  		file = File.expand_path("wordpress.xml")
  		file = File.open(file)
  		doc  = Nokogiri::XML(file.read().gsub("\u0004", ""))
	end
  end

  class Post
  	def posts
 		doc.xpath("//item[wp:post_type = 'post']").collect do |post|
    		WordPress::Post.new(post)
  		end
  	end
    def initialize(doc)
       @doc = doc
    end

    def title
  		@doc.xpath("title").text
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