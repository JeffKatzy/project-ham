# == Schema Information
#
# Table name: boroughs
#
#  id         :integer          not null, primary key
#  name       :string
#  area       :integer
#  population :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Borough < ActiveRecord::Base

  has_many :hospitals
  has_many :flus
  has_many :districts
  has_many :jobs
  has_many :farmers_markets
  has_many :community_gardens
  # remove the repetition btwn these methods
  # nice use of send
  def hospital_count(normalizer)
    num_of_hospitals = hospitals.count.to_f
    normalizer != "nil" ? num_of_hospitals/self.send(normalizer) : num_of_hospitals
  end

  def farmers_market_count(normalizer)
    num_of_markets = farmers_markets.count.to_f
    normalizer != "nil" ? num_of_markets/self.send(normalizer) : num_of_markets
  end

  def flu_count(normalizer)
    num_of_flus = flus.count.to_f
    normalizer != "nil" ? num_of_flus/self.send(normalizer) : num_of_flus
  end

  def community_garden_count(normalizer)
    num_of_gardens = community_gardens.count.to_f
    normalizer != "nil" ? num_of_gardens/self.send(normalizer) : num_of_gardens
  end

  def district_attendance(normalizer)
    array = districts.map do |district|
      district.attendance
    end
    avg_attendance=(array.inject{ |sum, x| sum + x } / array.size).round(2)
    normalizer != "nil" ? avg_attendance/self.send(normalizer) : avg_attendance
  end
end
