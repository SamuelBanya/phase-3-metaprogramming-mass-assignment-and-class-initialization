# Including 'pry' to use some breakpoints accordingly:
require "pry"

class User
  # NOTE: This is what was present before we refactored for 'mass assignment':
  # attr_accessor :name, :user_name, :age, :location, :bio

  # NOTE: This is the old version of the method before we refactored it to include 'mass assignment':
  # def initialize(user_name:, name:, age:, location:)
  def initialize(attributes)
    # NOTE: This is what was present before we refactored it to include 'mass assignment':
    # @user_name = user_name
    # @name = name
    # @location = location
    # @age = age
    attributes.each do |key, value |
      # NOTE: THIS is where we can define all of the previous 'attr_accessor' section to
      # specify the 'setter' and 'getter' methods required since we only have to pass in the 'key' value
      # accordingly:
      self.class.attr_accessor(key)
      self.send("#{key}=", value)
      # NOTE: This is the same as:
      # instance_of_user.key = value
      # Example:
      # instance_of_user.name = "Sophie"
    end
  end
end


twitter_user = {
  name: "Sophie",
  user_name: "sm_debenedetto",
  age: 26,
  location: "NY, NY"
}

sophie = User.new(twitter_user)

new_twitter_user = {
  name: "Sophie",
  user_name: "sm_debenedetto",
  location: "NY, NY"
}

# NOTE: This will break because 'User' is expecting an 'age' but the 'new_twitter_user' hash
# that we received does not include an 'age' key value:
# sam = User.new(new_twitter_user)

newest_twitter_user = {
  name: "Sophie",
  user_name: "sm_debenedetto",
  age: 26,
  location: "NY, NY",
  bio: "I'm a programmer living in NY!"
}

newest_sophie = User.new(newest_twitter_user)

puts "newest_sophie.name: ", newest_sophie.name

# binding.pry
