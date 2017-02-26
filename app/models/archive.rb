class Archive < ApplicationRecord
  has_attached_file :media, styles: {}, default_url: "/images/missing.png"
  validates_attachment_content_type :media, 
    :content_type => [
      "image/jpg",
      "image/jpeg", 
      "image/png", 
      "image/gif",
    ]
end
