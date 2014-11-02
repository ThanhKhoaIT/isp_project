class Package < ActiveRecord::Base
  
  # has_attached_file :images, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  # validates_attachment_content_type :images, :content_type => /\Aimage\/.*\Z/
  
end
