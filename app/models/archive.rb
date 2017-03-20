class Archive < ApplicationRecord
  def self.search(search)
    where("title LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%") 
  end
  acts_as_taggable
  has_attached_file :media, styles: {}, default_url: "/images/missing.png"
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
