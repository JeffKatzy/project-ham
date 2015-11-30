# == Schema Information
#
# Table name: comparisons
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


class Comparison 

  attr_accessor :data1, :data2, :normalizer1, :normalizer2
  attr_reader :correlation, :exp1, :exp2
  # I know this method is abstract, but its hard to determine what it does
  # Also, the use of Borough tells me that its not as abstract as some of the method names
  # I think that tests here would really help
  def initialize(data1, data2, normalizer1, normalizer2)
    @data1 = data1
    @data2 = data2
    @normalizer1 = normalizer1
    @normalizer2 = normalizer2
    @exp1 = calculate_scale(get_hash(data1,normalizer1))
    @exp2 = calculate_scale(get_hash(data2,normalizer2))
  end

  def get_hash(data_set_name,normalizer)
      Borough.all.each_with_object({}) do |borough, hash|
      hash[borough.id] = borough.send(data_set_name,normalizer)
    end
  end

  def calculate_scale(data_hash)
    max_num = data_hash.values.max
    BigDecimal.new(max_num.to_s).exponent

  end

  def calculate_correlation
    data_hash_1 = get_hash(data1,normalizer1)
    data_hash_2 = get_hash(data2,normalizer2)

    scores = {
      first_data:data_hash_1,  # => {1=>14, 2=>26, 3=>24, 4=>11, 5=>3}
      second_data:data_hash_2 # => {1=>88.21, 2=>89.6, 3=>90.17, 4=>91.99, 5=>90.98}
    }
    @correlation = Pearson.coefficient(scores, :first_data, :second_data)
  end
 
end
