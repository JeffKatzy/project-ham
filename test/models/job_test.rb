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

require 'test_helper'

class JobTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
