# == Schema Information
#
# Table name: jobs
#
#  id                :integer          not null, primary key
#  borough_id        :integer
#  labor_force       :integer
#  employed          :integer
#  unemployed        :integer
#  unemployment_rate :float
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Job < ActiveRecord::Base
  belongs_to :borough
  has_many :favorites
  # CSV should be in its own object
  def self.create_csv
    csv_text = File.read('public/labor_data.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Job.create!(row.to_hash)
    end
  end


end
