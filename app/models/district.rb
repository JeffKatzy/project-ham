class District < ActiveRecord::Base

DISTRICT_HASH = { 1 => [7, 8, 9, 10, 11, 12], 2 => [13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 32], 3 => [1, 2, 3, 4, 5, 6], 4 => [24, 25, 26, 27, 28, 29, 30], 5 => [31]}

  # def self.sat_scores 
  #   url = "http://data.cityofnewyork.us/api/views/f9bf-2cp4/rows.json"
  #   result = JSON.parse(open(url).read)
  #   district_array = result["data"]
  #   district_array
  # end 

  # def self.populate_db_scores 
  # end

  def self.attendance
    url = "http://data.cityofnewyork.us/api/views/rfpq-hs49/rows.json"
    result = JSON.parse(open(url).read)
    district_array = result["data"]
  end 

  def self.populate_db_attendance
    district_array = attendance[0..31]
    district_array.each do |district|
      array = DISTRICT_HASH.find do |boro|
        boro[1].include?(district[0])
      end
      borough_id = array[0]
      create(number: district[0], attendance: (district[9].to_f), borough_id: borough_id)
    end
  end
end

##moved require 'json', require 'open-uri', + require 'pry' to environment





