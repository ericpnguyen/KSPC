class Archive < ApplicationRecord
  def self.search(search, sortMethod, image, audio, video)
    search_length = search.split.length

    # generate the sql asking clause for only showing correct media types
    mediaTypes = []
    if image and image != ""
      mediaTypes.push("media_content_type LIKE 'image%'")
    end
    if audio and audio != ""
      mediaTypes.push("media_content_type LIKE 'audio%'")
    end
    if video and video != ""
      mediaTypes.push("media_content_type LIKE 'video%'")
    end
    mediaTypes = mediaTypes.join(' OR ')

    if search_length == 0
      searchResult = where(mediaTypes)
    else
      # find the where section that the ActsAsTaggableOn gem generates
      tag_where = tagged_with(search.split, :any => true).to_sql.partition("WHERE").last

      # generate a list of where conditions
      individual_search_terms_x2 = search.split.flat_map{
        |name| ["title LIKE '%#{name}%'", "description LIKE '%#{name}%'"] }

      if sortMethod && sortMethod != "none"
        searchResult = where('(' + mediaTypes + ') AND (' +
          individual_search_terms_x2.join(' OR ') + ' OR ' + tag_where + ')')
      end
    end

    if sortMethod == "sortTitle"
      searchResult.order("title ASC")
    elsif sortMethod == "sortUploaded"
      searchResult.order("updated_at DESC")
    elsif sortMethod == "sortDate"
      searchResult.order("date DESC")
    elsif sortMethod == "sortTitleZ"
      searchResult.order("title DESC")
    elsif sortMethod == "sortUploadedOld"
      searchResult.order("updated_at ASC")
    elsif sortMethod == "sortDateOld"
      searchResult.order("date ASC")
    elsif search_length == 0
      searchResult
    # a search was done but not sorting type was specified so do best match
    else
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
      WHERE numMatches > 0 AND (#{mediaTypes})
      ORDER BY numMatches DESC"
      results = ActiveRecord::Base.connection.exec_query(query)

      # to preserve order we return a list of Archives instead of an active record
      # relation. Feels like this could have a negative impact on performance of
      # search but haven't thought of better solution yet (think one should exist
      # since we are essentially double querying just to fix types).
      results = results.map{|x| find(x['id'])}

      results
    end
  end

  acts_as_taggable
  has_attached_file :media, styles: lambda { |a| a.instance.check_file_type}, :default_url => "missing.png"
  validates_attachment_content_type :media, :content_type => /.*/

  def check_file_type
    if is_image_type?
      {:thumb => {:geometry => "250x250#", :format => 'jpg', :time => 0}}
    elsif is_video_type?
      {:thumb => {:geometry => "250x250#", :format => 'jpg', :time => 0}}
    else
      {}
    end
  end
    
  def is_video_type?
    media_content_type =~ %r(video)
  end

  def is_image_type?
    media_content_type =~ %r(image)
  end
end
