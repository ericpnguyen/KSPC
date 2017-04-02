class Archive < ApplicationRecord
  def self.search(search)
    search_length = search.split.length
    if search_length > 0
      # this section of code feels hacky but I wasn't find another way to make it work

      # find the where section that the ActsAsTaggableOn gem generates
      tag_where = tagged_with(search.split, :any => true).to_sql.partition("WHERE").last

      # generate a list of where conditions
      individual_search_terms_x2 = search.split.flat_map{
        |name| ["title LIKE '%#{name}%'", "description LIKE '%#{name}%'"] }

      # generate a where query ordered by number of search matches. Inspired by:
      # http://stackoverflow.com/questions/3289095/order-by-maximum-condition-match
      query = "SELECT *
      FROM (SELECT *,
                ("
      individual_search_terms_x2.each do |cond|
        query += 'CASE WHEN ' + cond + ' THEN 1 ELSE 0 END + '
      end
      query += 'CASE WHEN ' + tag_where + ' THEN 1 ELSE 0 END '
      query += ") AS numMatches
        FROM archives
       ) xxx
      WHERE numMatches > 0
      ORDER BY numMatches DESC"
      results = ActiveRecord::Base.connection.exec_query(query)

      # to preserve order we return a list of Archives instead of an active record
      # relation. Feels like this could have a negative impact on performance of
      # search but haven't thought of better solution yet (think one should exist
      # since we are essentially double querying just to fix types).
      results = results.map{|x| find(x['id'])}

      results
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
