class Blog < ApplicationRecord
  has_attached_file :image, styles: { medium: "500x500>", thumb: "100x100>" }, default_url: "/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
