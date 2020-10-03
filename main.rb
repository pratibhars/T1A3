require_relative "methods/methods.rb"

require "artii"
require "colorize"
require "tty"
require "tty-prompt"
require "tty-table"

#main

login = false
prompt = TTY::Prompt.new

def write_user(users)
    File.open("./files/user_info.json", "w") do |f|
        f.write(users.to_json)
    end
end



loop do 
    render_logo
    option = prompt.select("Welcome to the Pill Box!".colorize(:red)) do |menu|
        menu.enum "."
        if login == false
            menu.choice "Login", 1
        end 
        if login == false || login == true 
        menu.choice "Help", 2
        end 
        if login == true
            menu.choice "Profile", 3
        end 
        if login == true
            menu.choice "Logout", 4
        end 
        
    end
    
    if option == 1
        prompt = TTY::Prompt.new
        option_login = prompt.select("New or Existing?".colorize(:red)) do |menu|
        menu.enum "."
        menu.choice "New", 1
        menu.choice "Existing", 2
        end
        if option_login == 1
            name = prompt.ask("Create your username:", required: true)
            password = prompt.mask("Create your password:", required: true)
            email = prompt.ask("Please enter your email:", required: true)
            system("clear")
            puts "Welcome #{name}, Let's create your profile"
            meds = prompt.ask("What medications would you like to add?", required: true)
            time = prompt.ask("When do you need to take this (e.g. Morning, Afternoon, Night, 2 times a day)?", required: true)
            duration = prompt.ask("How long do you need to take this for (e.g. 12 months, 6 months, 24 months)?", required: true)
            info = prompt.ask("When should you take the medication (options: before food, after food)", required: true)
            system("clear")
            user = {Name: name, Password: password, Email: email, Medication: meds, Intake_Time: time, Duration: duration, Extra_Info: info}
            user_list = JSON.parse(File.read("./files/user_info.json"))
            user_list["users"] << user
            write_user(users)
            puts "Thank you #{"Name"}, Your profile is now created".colorize(:green)

        elsif option_login == 2
            name = prompt.ask("Please enter your username:", required: true)
            password = prompt.mask("Please enter your password:", required: true)
            user_list = JSON.parse(File.read("./files/user_info.json"))
            user_list["Users"].each do |user|
                if user["Name"] == name && user["Password"] == password
                    puts "Welcome back #{name}!"
                elsif user["Name"] != name
                    puts "Invalid username, Please try again"
                elsif user["Password"] != password
                    puts "Invalid password, Please try again"
                end 
            end             
        end 
    end 
    if option == 2
        prompt = TTY::Prompt.new
        option_help = prompt.select("How can we assist?".colorize(:red)) do |menu|
            menu.enum "."
            menu.choice "Help Guide", 1
            menu.choice "Logout", 2
        end
        if option_help == 1
            puts "Welcome to The Pill Box"
            puts "This is a quick guide on how to best use the app"
        end 

    end 
    if option == 3
        profile_menu
    end 
    if option == 4
        puts "Thank you! Have a Good Day!"
        break  
    end 
    
end 
# prompt = TTY::Prompt.new
# option_profile = prompt.select("What would you like to do?".colorize(:red)) do |menu|
#     menu.enum "."
#     menu.choice "View", 1
#     menu.choice "Edit", 2
#     menu.choice "Logout", 3
# end
# if option_profile == 1
#     puts "View"
# end 

# if option_profile == 2
#     prompt = TTY::Prompt.new
#     profile_select = prompt.select("What would you like to do?".colorize(:red)) do |menu|
#         menu.enum "." 
#         menu.choice "Add Medication", 1
#         menu.choice "Update Medication", 2
#         menu.choice "Delete Medication", 3
#         menu.choice "Update Profile", 4
#     end 
#     if profile_select == 1
#         puts "What medications would you like to add?"
#         meds = user_input
#         puts "When do you need to take this (e.g. Morning, Afternoon, Night, 2 times a day)?"
#         time = user_input
#         puts "How long do you need to take this for (e.g. 12 months, 6 months, 24 months)?"
#         duration = user_input
#         puts "When should you take the medication (options: before food, after food)"
#         info = user_input
#         profile = {Medication: meds, Intake_Time: time, Duration: duration, Extra_Info: info}
#         profiles << profile
#         write_profile(profiles)
#         puts "#{meds} has now been added to your profile!"
#         puts "Would you like to add anything else? (y/n)"
#         add_more = user_input
#         if add_more == "y"
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
#         elsif add_more == "n"
            
#         end

#     elsif profile_select == 2
#         puts "Here's your current list of medications:"
#         puts "What would you like to update?"
#         answer = user_input
    
#     elsif profile_select == 3
#         puts "Here's your current list of medications:"
#         puts "What would you like to delete"
#         answer - user_input
#     end
#     # else profile_select == 4
#     #     puts "Would you like to amend your: Username, Password or Email?"
#     # end
# elsif option_profile == 3
#     puts "Thank you! Have a Good Day!"
#     break 
# end 
# render_logo
# render_logo
# render_logo
# edit_menu
#Login username and password
# current_meds = JSON.parse(File.read("files/profile_info.json"), symbolize_names: true)
# puts JSON.generate(current_meds)