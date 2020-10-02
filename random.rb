# require "terminal-table"
require_relative "methods/methods.rb"
require "artii"
require "colorize"
require "tty"
require "tty-prompt"
require "terminal-table"



# def table 
# profile = {Medication: "meds", Intake_Time: "time", Duration: "duration", Extra_Info: "info"}

# table = Terminal::Table.new :headings => [
#     "Medication",
#     "Intake Time",
#     "Duration",
#     "Extra Information"
# ], :rows => profile

# puts table
# end 

# table

# def write_profile(profiles)
#     File.open("./files/profile_info.json", "w") do |f|
#     f.write(profiles.to_json)
#     end
# end 
# login = false 
    prompt = TTY::Prompt.new
     
    name = prompt.ask("Create your username:", required: true)
    password = prompt.mask("Create your password:", required: true)
    email = prompt.ask("Please enter your email:", required: true)
    system("clear")
    puts "Welcome #{name}, Let's create your profile"
    meds = prompt.ask("What medications would you like to add?", required: true)
    time = prompt.ask("When do you need to take this (e.g. Morning, Afternoon, Night, 2 times a day)?", required: true)
    duration = prompt.ask("How long do you need to take this for (e.g. 12 months, 6 months, 24 months)?", required: true)
    info = prompt.ask("When should you take the medication (options: before food, after food)", required: true)
    # puts "Create your password:" 
    # password = user_input
    # puts "Please enter your email:"
    # email = user_input
    # meds = user_input
    # puts "When do you need to take this (e.g. Morning, Afternoon, Night, 2 times a day)?"
    # time = user_input
    # puts "How long do you need to take this for (e.g. 12 months, 6 months, 24 months)?"
    # duration = user_input
    # puts "When should you take the medication (options: before food, after food)"
    # info = user_input
    system("clear")
    user = {Name: name, Password: password, Email: email, Medication: meds, Intake_Time: time, Duration: duration, Extra_Info: info}
    users = JSON.parse(File.read("./files/user_info.json"))
    users["users"] << user
    write_user(users)
    # puts "Create your username:"
    # name = user_input
    # puts "Create your password:" 
    # password = user_input
    # puts "Please enter your email:"
    # email = user_input
    # system("clear")
    # puts "Welcome #{name}, Let's create your profile"
    # puts "What medications would you like to add?"
    # meds = user_input
    # puts "When do you need to take this (e.g. Morning, Afternoon, Night, 2 times a day)?"
    # time = user_input
    # puts "How long do you need to take this for (e.g. 12 months, 6 months, 24 months)?"
    # duration = user_input
    # puts "When should you take the medication (options: before food, after food)"
    # info = user_input
    # system("clear")
    # user = {Name: name, Password: password, Email: email, Medication: meds, Intake_Time: time, Duration: duration, Extra_Info: info}
    # users = JSON.parse(File.read("./files/user_info.json"))
    # users["users"] << user
    # write_user(users)

# loop do 
# prompt = TTY::Prompt.new
# option = prompt.select("Welcome to the Pill Box!".colorize(:red)) do |menu|
#     menu.enum "."
#     if login == false
#         menu.choice "Login", 1
#     end 
#     menu.choice "Help", 2
#     if login == true
#         menu.choice "Profile", 3
#     end
#     if login == true 
#         menu.choice "Logout", 4
#     end 
#     end 

# if option == 1
#     prompt = TTY::Prompt.new
#     option_login = prompt.select("New or Existing?".colorize(:red)) do |menu|
#         menu.enum "."
#         menu.choice "New", 1
#         menu.choice "Existing", 2
#     end

# elsif option == 2
#     prompt = TTY::Prompt.new
#     option_help = prompt.select("How can we help?".colorize(:red)) do |menu|
#         menu.enum "."
#         menu.choice "Help", 1
#     end

# elsif option == 3
#     prompt = TTY::Prompt.new
#     option_profile = prompt.select("What would you like to do?".colorize(:red)) do |menu|
#         menu.enum "."
#         menu.choice "View", 1
#         menu.choice "Edit", 2
#         menu.choice "Logout", 3
#     end

# elsif option == 4
#     puts "Thank you! Have a Good Day!"
#     break  
# end 

#         if option_login == 1
#             puts "Create your username:"
#             name = user_input
#             puts "Create your password:" 
#             password = user_input
#             puts "Please enter your email:"
#             email = user_input
#             system("clear")
#             user = {name: name, password: password, email: email}
#             users << user 
#             write_user(users)
#             login = true 
#             if login == true 
#                 puts "Welcome #{name}, Let's create your profile"
#                 puts "What medications would you like to add?"
#                 meds = user_input
#                 puts "When do you need to take this (e.g. Morning, Afternoon, Night, 2 times a day)?"
#                 time = user_input
#                 puts "How long do you need to take this for (e.g. 12 months, 6 months, 24 months)?"
#                 duration = user_input
#                 puts "When should you take the medication (options: before food, after food)"
#                 info = user_input
#                 system("clear")
#                 profile = {Medication: meds, Intake_Time: time, Duration: duration, Extra_Info: info}
#                 profiles << profile
#                 write_profile(profiles)
#             #elsif login == false
#                     #puts #please try again 
#             end 
            
#         elsif option_login == 2
#             puts "Please enter your username"
#             name = user_input
#             puts "Please enter your password"
#             password = user_input
#             # json = File.read("./files/user_info.json")
#             # valid_data = JSON.parse("/files/user_info.json")
#             # if name == valid_data["name"] && password == valid_data["password"]
#             puts "Welcome #{name}"
#             # else
#             #     puts "Incorrect Username or Password"
#             # end
#         end 

#     if option_profile == 1
#         def table 
#             profile = {Medication: "meds", Intake_Time: "time", Duration: "duration", Extra_Info: "info"}
            
#             table = Terminal::Table.new :headings => [
#                 "Medication",
#                 "Intake Time",
#                 "Duration",
#                 "Extra Information"
#             ], :rows => profile
            
#             puts table
#         end 
#         table

#     elsif option_profile == 2
#         prompt = TTY::Prompt.new
#         profile_select = prompt.select("What would you like to do?".colorize(:red)) do |menu|
#         menu.enum "." 
#         menu.choice "Add Medication", 1
#         menu.choice "Update Medication", 2
#         menu.choice "Delete Medication", 3
#         menu.choice "Update Profile", 4
#         end 
    
#         if profile_select == 1
#             puts "What medications would you like to add?"
#             meds = user_input
#             puts "When do you need to take this (e.g. Morning, Afternoon, Night, 2 times a day)?"
#             time = user_input
#             puts "How long do you need to take this for (e.g. 12 months, 6 months, 24 months)?"
#             duration = user_input
#             puts "When should you take the medication (options: before food, after food)"
#             info = user_input
#             profile = {Medication: meds, Intake_Time: time, Duration: duration, Extra_Info: info}
#             profiles << profile
#             write_profile(profiles)
#             puts "#{meds} has now been added to your profile!"
#             puts "Would you like to add anything else? (y/n)"
#             add_more = user_input
#                 if add_more == "y"
#                     puts "What medications would you like to add?"
#                     meds = user_input
#                     puts "When do you need to take this (e.g. Morning, Afternoon, Night, 2 times a day)?"
#                     time = user_input
#                     puts "How long do you need to take this for (e.g. 12 months, 6 months, 24 months)?"
#                     duration = user_input
#                     puts "When should you take the medication (options: before food, after food)"
#                     info = user_input
#                     profile = {Medication: meds, Intake_Time: time, Duration: duration, Extra_Info: info}
#                     profiles << profile
#                     write_profile(profiles)
#                 elsif add_more == "n"
#                     profile_select
#                 end
#         elsif profile_select == 2
#             puts "Here's your current list of medications"
#         elsif profile_select == 3
#             puts "What would you like to delete"
#         elsif profile_select == 4
#             puts "Would you like to amend your: Username, Password or Email?"
#         end
#     elsif option_login == 3
#         puts "Thank you! Have a Good Day!"
#         break 
#     end 
# end 