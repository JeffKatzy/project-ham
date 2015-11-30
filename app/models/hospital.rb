# == Schema Information
#
# Table name: hospitals
#
#  id            :integer          not null, primary key
#  borough_id    :integer
#  name          :string
#  hospital_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Hospital < ActiveRecord::Base


  belongs_to :borough
  has_many :favorites
  # remove pry
  def self.number_of
    binding.pry
  end

end
