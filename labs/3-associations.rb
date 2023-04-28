# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Activity.destroy_all
# **************************

# Lab 3: Associations
# - We've added data into the contacts table.  Next, we'll add data
#   into the activities table.  Follow the steps below to insert
#   activity data in the database.  Afterwards, display a
#   single salesperson's activity data:

# 1. insert 3 rows in the activities table with relationships to
# a single salesperson and 2 different contacts

darth = Salesperson.where({"first_name" => "Darth", "last_name" => "Vader"})
tim = Contact.where({"first_name" => "Tim", "last_name" => "Cook"})
craig = Contact.where({"first_name" => "Craig"})

new_activity = Activity.new
    new_activity["salesperson_id"] = darth[0]["id"]
    new_activity["contact_id"] = tim[0]["id"]
    new_activity["note"] = "2023-01-01 Sold 100,000 droids to the human Tim Cook."
new_activity.save

new_activity2 = Activity.new
    new_activity2["salesperson_id"] = darth[0]["id"]
    new_activity2["contact_id"] = craig[0]["id"]
    new_activity2["note"] = "2023-01-01 Sold 25,000 weapons to the underling of Tim Cook, Craig."
new_activity2.save

new_activity3 = Activity.new
    new_activity3["salesperson_id"] = darth[0]["id"]
    new_activity3["contact_id"] = tim[0]["id"]
    new_activity3["note"] = "2023-02-01 Called back 20,000 droids due to defects!"
new_activity3.save

# 2. Display all the activities between the salesperson used above
# and one of the contacts (sample output below):

# activities = Activity.where({"salesperson_id" => darth[0]["id"], "contact_id" => tim[0]["id"],})
# puts "Activities between #{darth[0]["first_name"]} and #{tim[0]["first_name"]} #{tim[0]["last_name"]}:"
# for activity in activities
#     puts " -- #{activity["note"]}" 
# end

# # ---------------------------------
# # Activities between Ben and Tim Cook:
# # - quick checkin over facetime
# # - met at Cupertino

# # CHALLENGE:

# # 3. Similar to above, but display all of the activities for the salesperson
# # across all contacts (sample output below):

# activities = Activity.where({"salesperson_id" => darth[0]["id"]})
# puts "#{darth[0]["first_name"]}'s activities:"
# for activity in activities
#     contact_id = activity["contact_id"]
#     contact = Contact.find_by({"id" => contact_id})
#     contact_name = contact["first_name"]+" "+contact["last_name"]
#     puts "-- #{contact_name} - #{activity["note"]}"
# end

# # # ---------------------------------
# # # Ben's Activities:
# # # Tim Cook - quick checkin over facetime
# # # Tim Cook - met at Cupertino
# # # Jeff Bezos - met at Blue Origin HQ

# # # 3a. Can you include the contact's company?

# activities = Activity.where({"salesperson_id" => darth[0]["id"]})
# puts "#{darth[0]["first_name"]}'s activities:"
# for activity in activities
#     contact_id = activity["contact_id"]
#     contact = Contact.find_by({"id" => contact_id})
#         contact_name = contact["first_name"]+" "+contact["last_name"]
#         contact_company_id = contact["company_id"]
#     company = Company.find_by({"id" => contact_company_id})
#         company_name = company["name"]
#     puts "-- #{contact_name} (#{company_name}) - #{activity["note"]}"
# end

# # ---------------------------------
# # Ben's Activities:
# # Tim Cook (Apple) - quick checkin over facetime
# # Tim Cook (Apple) - met at Cupertino
# # Jeff Bezos (Amazon) - met at Blue Origin HQ

# # CHALLENGE:
# # 4. How many activities does each salesperson have?

puts "----------------------"
salespeople = Salesperson.all
for salesperson in salespeople
    salesperson_name = salesperson["first_name"]+" "+salesperson["last_name"]
    salesperson_id = salesperson["id"]
    activities = Activity.where({"salesperson_id" => salesperson_id})
    activity_count = activities.count
    puts "#{salesperson_name}: #{activity_count} activities"
end

# # ---------------------------------
# # Ben Block: 3 activities
# # Brian Eng: 0 activities
