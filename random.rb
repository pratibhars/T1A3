# require "terminal-table"
require_relative "methods/methods.rb"
require "artii"
require "colorize"
require "tty"
require "tty-prompt"
require "terminal-table"
require "json"


prompt = TTY::Prompt.new

view_meds

# name = prompt.ask("Please enter your username:", required: true)
# password = prompt.mask("Please enter your password:", required: true)
# user_list = JSON.parse(File.read("./files/user_info.json"))
# user_list["Users"].each do |user|
#     if user["Name"] == name && user["Password"] == password
#         puts "Welcome back #{name}!"
#         profile_menu
#     elsif user["Name"] != name || user["Password"] != password
#         puts "Invalid account details, Please try again"
#     end
# end 
  
# name = prompt.ask("Please enter your username:", required: true)
# password = prompt.mask("Please enter your password:", required: true)
# user_list = JSON.parse(File.read("./files/user_info.json"))
# user_list["Users"].each do |user|
#     if user["Name"] == name && user["Password"] == password
#         puts "Welcome back #{name}!"
#         profile_menu
#     elsif user["Name"] != name && user["Password"] != password
#         puts "User Account details Invalid. Please try again"
#     end 
# end 



# new_user 

#             name = prompt.ask("Create your username:", required: true)
#             password = prompt.mask("Create your password:", required: true)
#             email = prompt.ask("Please enter your email:", required: true)
#             system("clear")
#             puts "Welcome #{name}, Let's create your profile"
#             meds = prompt.ask("What medications would you like to add?", required: true)
#             time = prompt.ask("When do you need to take this (e.g. Morning, Afternoon, Night, 2 times a day)?", required: true)
#             duration = prompt.ask("How long do you need to take this for (e.g. 12 months, 6 months, 24 months)?", required: true)
#             info = prompt.ask("When should you take the medication (options: before food, after food)", required: true)
#             system("clear")
#             user ={Name: name, Password: password, Email: email, Medication:{Med_Name: meds, Intake_Time: time, Duration: duration, Extra_Info: info}}
#             user_list = JSON.parse(File.read("./files/user_info.json"))
#             user_list["Users"] << user
#             write_user(user_list)
#             puts "Thank you #{name}, Your profile is now created".colorize(:green)

# prompt = TTY::Prompt.new

#     name = prompt.ask("Can we please confirm your username?", required: true).colorize(:pink)
#     meds = prompt.ask("What medications would you like to add?", required: true).colorize(:pink)
#     time = prompt.ask("When do you need to take this (e.g. Morning, Afternoon, Night, 2 times a day)?", required: true).colorize(:pink)
#     duration = prompt.ask("How long do you need to take this for (e.g. 12 months, 6 months, 24 months)?", required: true).colorize(:pink)
#     info = prompt.ask("When should you take the medication (options: before food, after food)", required: true).colorize(:pink)
#     system("clear")
#     med_data = {Med_Name: meds, Intake_Time: time, Duration: duration, Extra_Info: info}
#     add_new_med(name, med_data)
    
    # puts "Would you like to add anymore? (Y/N)"
    # answer = user_input
    # if answer == "Y"
    #     name = prompt.ask("Can we please confirm your username?", required: true).colorize(:pink)
    #     meds = prompt.ask("What medications would you like to add?", required: true).colorize(:pink)
    #     time = prompt.ask("When do you need to take this (e.g. Morning, Afternoon, Night, 2 times a day)?", required: true).colorize(:pink)
    #     duration = prompt.ask("How long do you need to take this for (e.g. 12 months, 6 months, 24 months)?", required: true).colorize(:pink)
    #     info = prompt.ask("When should you take the medication (options: before food, after food)", required: true).colorize(:pink)
    #     system("clear")
    #     med_data = {Med_Name: meds, Intake_Time: time, Duration: duration, Extra_Info: info}
    #     add_new_med(name, med_data)
    #     puts "press enter to return to menu".colorize(:red)
    #     profile_menu
    # elsif answer == "N"
    #     profile_menu
    # end 




#     meds = prompt.ask("What medication would you like to update", required: true)
#     new_meds = prompt.ask("What's the name of your new medication", required: true)
#     new_time = prompt.ask("When do you need to take this (e.g. Morning, Afternoon, Night, 2 times a day)?", required: true)
#     new_duration = prompt.ask("How long do you need to take this for (e.g. 12 months, 6 months, 24 months)?", required: true )
#     new_info = prompt.ask("When should you take the medication (options: before food, after food)", required: true)
#     update_meds = {Med_name: new_meds, Intake_Time: new_time, Duration: new_duration, Extra_Info: new_info}
#     # begin 
#         user_list = JSON.parse(File.read("./files/user_info.json"))
#         user_list["Users"].each do |user|
#             user["Medication"] = true if user_list.has_value?("meds")
#                 user["Medication"] = update_meds
#             File.write("./files/user_info.json", JSON.generate(user_list))
#         end 
    # end        

        # user["Name"] = true if user_list.has_value?("Name") && user["Medication"] = true if user_list.has_value?("meds")
        #         File.write("./files/user_info.json", JSON.generate(user_list))
        #     end
        # rescue(Errno::ENOENT)
        #     puts "Medications not on file, Please add medications to your account".colorize(:red)
        # end 
        
        
        #     user["Medication"] << update_meds 
        # elsif user["Name"] != name 
        #     puts "Invalid Username, Try again"
        #     profile_menu
        # elsif user["Med_Name"] != meds 
        #     puts "This medication is currently not on your profile! Please try again"
        #     profile_menu
        # end 
# users_info = JSON.parse(File.read("./files/user_info.json"))

# def write_user(users_info)
#     File.open("./files/user_info.json", "w") do |f|
#         f.write(users.to_json)
#     end
# end





# def write_user(user_list)
#     File.open("./files/user_info.json", "w") do |f|
#         f.write(user_list.to_json)
#     end
# end

#     prompt = TTY::Prompt.new
#     name = prompt.ask("Create your username:", required: true)
#     password = prompt.mask("Create your password:", required: true)
#     email = prompt.ask("Please enter your email:", required: true)
#     system("clear")
#     user ={Name: name, Password: password, Email: email}
#     user_list = JSON.parse(File.read("./files/user_info.json"))
#     user_list["Users"] << user
#     write_user(user_list)
#     puts "Thank you for creating your account"
#     name = prompt.ask("Can we reconfirm your username, before creating your profile.", required: true)
#     meds = prompt.ask("What medications would you like to add?", required: true)
#     time = prompt.ask("When do you need to take this (e.g. Morning, Afternoon, Night, 2 times a day)?", required: true)
#     duration = prompt.ask("How long do you need to take this for (e.g. 12 months, 6 months, 24 months)?", required: true)
#     info = prompt.ask("When should you take the medication (options: before food, after food)", required: true)
#     system("clear")
#     med_data ={Med_Name: meds, Intake_Time: time, Duration: duration, Extra_Info: info}
#     add_new_med(name, med_data)
#     puts "Thank you #{name}, Your profile is now created".colorize(:green)


# prompt = TTY::Prompt.new
# name = prompt.ask("Please enter your username:", required: true)
# password = prompt.mask("Please enter your password:", required: true)
# begin
#     user_list = JSON.parse(File.read("./files/user_info.json"))
#     user_list["Users"].each do |user|
#         if user["Name"] == name && user["Password"] == password
#             puts "Welcome back #{name}!"
#             profile_menu
#         elsif user["Name"] != name
#             puts "Invalid username, Please try again"
#         elsif user["Password"] != password
#             puts "Invalid password, Please try again"
#         end
#     end 
# rescue (Errno::ENOENT)
#     puts "User Accounts not registered, Please create an account".colorize(:red)
# end         


# user_list = JSON.parse(File.read("./files/user_info.json"))

# def write_user(user_list)
#     File.open("./files/user_info.json", "w") do |f|
#         f.write(user_list.to_json)
#     end
# end

# prompt = TTY::Prompt.new
# name = prompt.ask("Create your username:", required: true)
# password = prompt.mask("Create your password:", required: true)
# email = prompt.ask("Please enter your email:", required: true)
# system("clear")
# puts "Welcome #{name}, Let's create your profile"
# meds = prompt.ask("What medications would you like to add?", required: true)
# time = prompt.ask("When do you need to take this (e.g. Morning, Afternoon, Night, 2 times a day)?", required: true)
# duration = prompt.ask("How long do you need to take this for (e.g. 12 months, 6 months, 24 months)?", required: true)
# info = prompt.ask("When should you take the medication (options: before food, after food)", required: true)
# system("clear")
# user ={Name: name, Password: password, Email: email, Medication:{Med_Name: meds, Intake_Time: time, Duration: duration, Extra_Info: info}}
# user_list = JSON.parse(File.read("./files/user_info.json"))
# user_list["Users"] << user
# write_user(user_list)
# puts "Thank you #{name}, Your profile is now created".colorize(:green)

# name = prompt.ask("Create your username:", required: true)
# password = prompt.mask("Create your password:", required: true)
# email = prompt.ask("Please enter your email:", required: true)
# system("clear")
# user ={Name: name, Password: password, Email: email}
# user_list = JSON.parse(File.read("./files/user_info.json"))
# user_list["Users"] << user
# write_user(user_list)
# puts "Thank you #{name}, Your profile is now created".colorize(:green) 

# name = prompt.ask("Can we please confirm your username?", required: true).colorize(:pink)
# meds = prompt.ask("What medications would you like to add?", required: true).colorize(:pink)
# time = prompt.ask("When do you need to take this (e.g. Morning, Afternoon, Night, 2 times a day)?", required: true).colorize(:pink)
# duration = prompt.ask("How long do you need to take this for (e.g. 12 months, 6 months, 24 months)?", required: true).colorize(:pink)
# info = prompt.ask("When should you take the medication (options: before food, after food)", required: true).colorize(:pink)
# system("clear")
# med_data = {Med_Name: meds, Intake_Time: time, Duration: duration, Extra_Info: info}
# user_list = JSON.parse(File.read("./files/user_info.json"))
# user_list["Users"].each do |user|
#     if user["Name"] == name
#         user["Medication"] << med_data
#     end
# end 
# File.write("./files/user_info.json", JSON.generate(user_list))

# puts "Thank you for creating your account"
# name = prompt.ask("Can we reconfirm your username, before creating your profile.", required: true)
# meds = prompt.ask("What medications would you like to add?", required: true)
# time = prompt.ask("When do you need to take this (e.g. Morning, Afternoon, Night, 2 times a day)?", required: true)
# duration = prompt.ask("How long do you need to take this for (e.g. 12 months, 6 months, 24 months)?", required: true)
# info = prompt.ask("When should you take the medication (options: before food, after food)", required: true)
# system("clear")
# med_data ={Med_Name: meds, Intake_Time: time, Duration: duration, Extra_Info: info}
# user_list["Users"].each do |user|
#     if user["Name"] == name
#         user["Medication"] << med_data
#     end



    # name = prompt.ask("Create your username:", required: true)
    # password = prompt.mask("Create your password:", required: true)
    # email = prompt.ask("Please enter your email:", required: true)
    # system("clear")
    # puts "Welcome #{name}, Let's create your profile"
    # meds = prompt.ask("What medications would you like to add?", required: true)
    # time = prompt.ask("When do you need to take this (e.g. Morning, Afternoon, Night, 2 times a day)?", required: true)
    # duration = prompt.ask("How long do you need to take this for (e.g. 12 months, 6 months, 24 months)?", required: true)
    # info = prompt.ask("When should you take the medication (options: before food, after food)", required: true)
    # system("clear")
    # user ={Name: name, Password: password, Email: email, Med_Name: meds, Intake_Time: time, Duration: duration, Extra_Info: info}
    # user_list = JSON.parse(File.read("./files/user_info.json"))
    # user_list["Users"] << user
    # write_user(user_list)
    # puts "Thank you #{name}, Your profile is now created".colorize(:green)


# def view_meds
#     password = prompt.mask("Can we please re-confirm your password")
#     user_list = JSON.parse(File.read("./files/user_info.json"))
#     user_list["Users"].each do |user|
#         if user["Password"] == password
#             user["Medication"].each do |med|
#                 puts med["Med_Name"].colorize(:pink)
#             end
#         end 
#     end

# end 

# json = JSON.parse(File.read("./files/user_info.json"))
# json["users"].each do |user|
#     if user["Password"] == password
#         puts "Your current medications are: #{user["Medication"]}"
#     end 


# profile_menu

# name = prompt.ask("Please confirm your username")
# meds = prompt.ask("What medication would you like to update")
# new_meds = prompt.ask ("What's the name of your new medication")
# time = prompt.ask("When do you need to take this (e.g. Morning, Afternoon, Night, 2 times a day)?")
# duration = prompt.ask("How long do you need to take this for (e.g. 12 months, 6 months, 24 months)?")
# info = prompt.ask("When should you take the medication (options: before food, after food)")
# update_meds = {Med_name: new_meds, Intake_Time: time, Duration: duration, Extra_Info: info}
# user_list = JSON.parse(File.read("./files/user_info.json"))
# user_list["Users"].each do |user|
#     if user["Name"] == name && user["Med_Name"] == meds
#         user["Medication"] << update_meds 
#     elsif user["Name"] != name 
#         puts "Invalid Username, Try again"
#         profile_menu
#     elsif user["Med_Name"] != meds 
#         puts "This medication is currently not on your profile! Please try again"
#         profile_menu
#     end 
#     File.write("./files/user_info.json", JSON.generate(user_list))
# end
        


# def add_new_med(name, med_data)
#     user_list = JSON.parse(File.read("./files/user_info.json"))
#     user_list["Users"].each { |user|
#         if user["Name"] == name
#             user["Medication"] << med_data
#         end
#     }
#     File.write("./files/user_info.json", JSON.generate(user_list))
# end

# def retrieve_meds(name)
#     user_list = JSON.parse(File.read("./files/user_info.json"))
#     user_list["Users"].each { |user|
#         if user["Name"] == name
#             user["Medication"].each { |med|
#                 puts "Name: #{med["Med_Name"]}"
#                 puts "Intake Time: #{med["Intake_Time"]}"
#                 puts "Duration: #{med["Duration"]}"
#                 puts "Extra Info: #{med["Extra_Info"]}"
#             }
#         end
#     }
# end

# prompt = TTY::Prompt.new

# name = prompt.ask("Can we please confirm your username?", required: true)
# meds = prompt.ask("What medications would you like to add?", required: true)
# time = prompt.ask("When do you need to take this (e.g. Morning, Afternoon, Night, 2 times a day)?", required: true)
# duration = prompt.ask("How long do you need to take this for (e.g. 12 months, 6 months, 24 months)?", required: true)
# info = prompt.ask("When should you take the medication (options: before food, after food)", required: true)
# system("clear")
# med_data = {Med_Name: meds, Intake_Time: time, Duration: duration, Extra_Info: info}
# add_new_med(name, med_data)
# retrieve_meds(name)

