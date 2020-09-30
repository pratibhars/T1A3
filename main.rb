
require_relative "methods/methods.rb"
# require_relative "classes/classes.rb"

require "artii"
require "colorize"
require "tty"
require "tty-prompt"
require "tty-table"

#main
users = []
profiles = []

login = false 

def write_user(users)

    File.open("files/user_info.json", "a") do |f|
        f.write(users.to_json)
    end

end

def write_profile(profiles)

    File.open("files/profile_info.json", "a") do |f|
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
        menu.choice "Help", 2
        if login == true
            menu.choice "Profile", 3
        end
        if login == true 
            menu.choice "Logout", 4
        end 
        
    end
    
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
                puts json
                # valid_data = ("/files/user_info.json")
                # if name == valid_data["name"] && password == valid_data["password"]
                puts "Welcome #{name}"
                # else
                #     puts "Incorrect Username or Password"
                # end
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
                    profile_select
                end
            elsif profile_select == 2
                puts "Here's your current list of medications:"
                # json = File.read("./files/profile_info.json")
            
            elsif profile_select == 3
                puts "Here's your current list of medications:"
                puts "What would you like to delete"
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