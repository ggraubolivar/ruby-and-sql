# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/2-models.rb

# **************************
# DON'T CHANGE OR MOVE
Salesperson.destroy_all
# **************************

# Lab 2: Models
# - We've added data into the companies table.  Next, we'll add data
#   into the salespeople table.  Follow the steps below to insert and
#   read rows of salesperson data.  Update a row.  Afterwards, display
#   how many rows have been inserted into the salespeople table.
#   Lastly, if you want a challenge, try writing code to display the
#   full name of each salesperson.

# 1a. check out the schema file
# 1b. check out the model file

# 2. insert 1-2 rows in salespeople table.

john = Salesperson.new
    john["first_name"] = "John"
    john["last_name"] = "Doe"
    john["email"] = "john.doe@company.com"
john.save

jane = Salesperson.new
    jane["first_name"] = "Jane"
    jane["last_name"] = "Doe"
    jane["email"] = "jane.doe@company.com"
jane.save

# 3. write code to display how many salespeople rows are in the database

puts "There are #{Salesperson.all.count} salespeople."

# ---------------------------------

# Salespeople: 2

# 4. modify/update column data for a row in the salespeople table.

john.destroy

darth = Salesperson.new
    darth["first_name"] = "Darth"
    darth["last_name"] = "Vader"
    darth["email"] = "darth.vader@empire.com"
darth.save

jane["last_name"] = "Vader"
jane["email"] = "jane.vader@empire.com"
jane.save

puts "There are #{Salesperson.all.count} salespeople."

# CHALLENGE:

# 5. write code to display each salesperson's full name

puts "Salespeople: #{Salesperson.all.count}"
array1 = Salesperson.all
N = array1.length-1
for i in (0..N)
    x = array1[i]
        puts "#{x["first_name"]} #{x["last_name"]}"
end

# ---------------------------------
# Salespeople: 2
# Ben Block
# Brian Eng