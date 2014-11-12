class Package < ActiveRecord::Base
  
  has_many :comments
  
  has_attached_file :image, :styles => { :medium => "262x132#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  
  has_and_belongs_to_many :cities
  
  def city_ids=(ids)
    ids -= [""]
    CitiesPackages.where(package_id: self.id).destroy_all
    ids.each do |id_city|
      CitiesPackages.create({package_id: self.id, city_id: id_city})
    end
  end

  
end
