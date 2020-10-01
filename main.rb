
require_relative "methods/methods.rb"
# require_relative "classes/classes.rb"

require "artii"
require "colorize"
require "tty"
require "tty-prompt"
require "tty-table"

#main
# user = []
# you had ^^ which was defaulting the users to an empty array, it should of been what was in your json file
# for this one - I should have written it as {"users": []}?
# no, I have output the users, so after you login you can see what it looks like
# oh yes, as a array
# the json is an array, and each user in an hash in the array
# yes that makes sense. sorry so it would essentially have been parsing the json file into users as opposed to an empty array,
# You will need to do the same thing with your profiles

users = JSON.parse(File.read("./files/user_info.json"))
profiles = JSON.parse(File.read("./files/profile_info.json"))
login = false 

# As we were just appending, you were adding a new json array to the existing one, which wasn't the intended action
# So what we are doing now is having the <users> which was pushed to previously, and overwriting the old users
# You'll want to do the same thing here

def write_user(users)
    File.open("./files/user_info.json", "w") do |f|
        f.write(users.to_json)
    end

end

def write_profile(profiles)
    File.open("./files/profile_info.json", "w") do |f|
    f.write(profiles.to_json)
    end
end 

loop do 
    render_logo
    
    prompt = TTY::Prompt.new
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
    p users

    
    if option == 1
        prompt = TTY::Prompt.new
        option = prompt.select("New or Existing?".colorize(:red)) do |menu|
            menu.enum "."
            menu.choice "New", 1
            menu.choice "Existing", 2
        end
            if option == 1
                puts "Create your username:"
                name = user_input
                puts "Create your password:" 
                password = user_input
                puts "Please enter your email:"
                email = user_input
                system("clear")
                user = {name: name, password: password, email: email}
                users << user 
                write_user(users)
                login = true 
                if login == true 
                    render_logo
                    puts "Welcome #{name}, Let's create your profile"
                    puts "What medications would you like to add?"
                    meds = user_input
                    puts "When do you need to take this (e.g. Morning, Afternoon, Night, 2 times a day)?"
                    time = user_input
                    puts "How long do you need to take this for (e.g. 12 months, 6 months, 24 months)?"
                    duration = user_input
                    puts "When should you take the medication (options: before food, after food)"
                    info = user_input
                    system("clear")
                    profile = {Medication: meds, Intake_Time: time, Duration: duration, Extra_Info: info}
                    profiles << profile
                    write_profile(profiles)
                end 
                
            elsif option == 2
                puts "Please enter your username"
                name = user_input
                puts "Please enter your password"
                password = user_input
                json = JSON.parse(File.read("./files/user_info.json"))
                json.find_index do |e| 
                    if e["name"] == name && e["password"] == password
                        puts "Welcome #{name}"
                        login = true
                    end
                    if login == true 
                        
                    end
                end
            end 
    end 
    if option == 2
        prompt = TTY::Prompt.new
        option_help = prompt.select("How can we help?".colorize(:red)) do |menu|
            menu.enum "."
            menu.choice "Help", 1
        end
    if option_help == 1
        puts "Welcome to The Pill Box"
        puts "This is a quick guide on how to best use the app"

    end 

    end 
    if option == 3
        prompt = TTY::Prompt.new
        option_profile = prompt.select("What would you like to do?".colorize(:red)) do |menu|
            menu.enum "."
            menu.choice "View", 1
            menu.choice "Edit", 2
            menu.choice "Logout", 3
        end
        if option_profile == 1
            puts "View"
        end 
        
        if option_profile == 2
            prompt = TTY::Prompt.new
            profile_select = prompt.select("What would you like to do?".colorize(:red)) do |menu|
                menu.enum "." 
                menu.choice "Add Medication", 1
                menu.choice "Update Medication", 2
                menu.choice "Delete Medication", 3
                menu.choice "Update Profile", 4
            end 
            if profile_select == 1
                puts "What medications would you like to add?"
                meds = user_input
                puts "When do you need to take this (e.g. Morning, Afternoon, Night, 2 times a day)?"
                time = user_input
                puts "How long do you need to take this for (e.g. 12 months, 6 months, 24 months)?"
                duration = user_input
                puts "When should you take the medication (options: before food, after food)"
                info = user_input
                profile = {Medication: meds, Intake_Time: time, Duration: duration, Extra_Info: info}
                profiles << profile
                write_profile(profiles)
                puts "#{meds} has now been added to your profile!"
                puts "Would you like to add anything else? (y/n)"
                add_more = user_input
                if add_more == "y"
                    puts "What medications would you like to add?"
                    meds = user_input
                    puts "When do you need to take this (e.g. Morning, Afternoon, Night, 2 times a day)?"
                    time = user_input
                    puts "How long do you need to take this for (e.g. 12 months, 6 months, 24 months)?"
                    duration = user_input
                    puts "When should you take the medication (options: before food, after food)"
                    info = user_input
                    profile = {Medication: meds, Intake_Time: time, Duration: duration, Extra_Info: info}
                    profiles << profile
                    write_profile(profiles)
                elsif add_more == "n"
                    
                end

            elsif profile_select == 2
                puts "Here's your current list of medications:"
                puts "What would you like to update?"
                answer = user_input
            
            elsif profile_select == 3
                puts "Here's your current list of medications:"
                puts "What would you like to delete"
                answer - user_input
            end
            # else profile_select == 4
            #     puts "Would you like to amend your: Username, Password or Email?"
            # end
        elsif option_profile == 3
            puts "Thank you! Have a Good Day!"
            break 
        end 
    elsif option == 4
        puts "Thank you! Have a Good Day!"
        break  
    end 
    
end 
# render_logo
# render_logo
# render_logo
# edit_menu
#Login username and password
# current_meds = JSON.parse(File.read("files/profile_info.json"), symbolize_names: true)
# puts JSON.generate(current_meds)