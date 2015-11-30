class Search

  MODEL_ARRAY = [CommunityGarden, District, FarmersMarket, Flu, Hospital]
# good object
  def self.for(model, keyword)
    object = MODEL_ARRAY.find do |location|
      location.to_s == model
    end
    array = object.all
    choice = array.find do |object|
      object.name == keyword 
    end
    choice
  end

end