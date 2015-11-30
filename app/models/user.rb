class User < ActiveRecord::Base

  has_many :favorites

# remove pry

  def self.create_with_omniauth(auth)
    binding.pry
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end

end
