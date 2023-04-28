# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/0-classes.rb

# String Class

favorite_food = "tacos"

# String Methods

# Inpsepct the variable 
puts favorite_food.inspect

#Prints the class
puts favorite_food.class

#Prints the instance upper case.
puts favorite_food.upcase

# Defining Classes

# class Dog
#     def speak
#         puts "Woof"
#     end
# end

# my_dog = Dog.new
# puts my_dog.class
# puts my_dog.speak

# Empowering Classes

class Dog < Hash
    def speak
        puts "Woof!"
    end
end

my_dog = Dog.new
my_dog["name"] = "Jenkins"
puts "my name is #{my_dog["name"]}"
my_dog.speak
