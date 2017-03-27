class Archive < ApplicationRecord
  def self.search(search)
    search_length = search.split.length
    if search_length > 0
      # had to be very hacky in this if since I could not .or the result of a
      # mysql where which I wrote with the result of a tagged_with despite them
      # having the same structure so far as I could tell from extensive testing.
      # Was getting a ArgumentError that they must be structurally compatable
      # and that they had incompatable values

      # find the where section that the ActsAsTaggableOn gem generates
      tag_where = tagged_with(search.split, :any => true).to_sql.partition("WHERE").last

      # generate a list of [searchterm1, searchterm1, searchterm2, searchterm2, ...]
      individual_search_terms_x2 = search.split.flat_map{ |name| ["%#{name}%", "%#{name}%"] }

      # create the where query which will combine searching title, description,
      # and the where term given by ActsAsTaggableOn joining by OR to display
      # the maximal possible matches
      where_term = [(["title LIKE ? OR description LIKE ?"] * search_length + [tag_where]).join(' OR ')] \
              + individual_search_terms_x2
      where(where_term)
    else
      # no search terms so display all. This seems like easiest way to select all
      where("title LIKE ?", "%#{search}%")
    end

  end
  acts_as_taggable
  has_attached_file :media, :styles => {:thumb => {:geometry => "250x250#", :format => 'jpg', :time => 0}}, :default_url => "/images/missing.png"
  validates_attachment_content_type :media, 
    :content_type => [
      "image/jpg",
      "image/jpeg", 
      "image/png", 
      "image/gif",
      'audio/mpeg',
      'audio/x-mpeg',
      'audio/mp3',
      'audio/x-mp3',
      'audio/mpeg3',
      'audio/x-mpeg3',
      'audio/mpg',
      'audio/x-mpg',
      'audio/x-mpegaudio',
      'video/mp4',
      'video/x-msvideo'
    ]
end
