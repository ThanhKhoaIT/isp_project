class Flight < ActiveRecord::Base
  belongs_to :from_city, class_name: "City", foreign_key: "city_from_id"
  belongs_to :to_city, class_name: "City", foreign_key: "city_to_id"
  
  validate :city_from_id, :city_to_id, presence: true
  
  def self.allow_move(from, to)
    Flight.where({city_from_id: from, city_to_id: to}).collect{|f| f.to_json}
  end
  
  def to_json
    {
      id: self.id,
      city_from_id: city_from_id,
      city_to_id: city_to_id,
      price: price,
      total_hour: total_hour,
      type_use: type_use
    }
  end


end
