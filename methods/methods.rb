require "artii"
require "tty-prompt"
require "colorize"
require "json"

users = JSON.parse(File.read("./files/user_info.json"))

#getting information from users
def user_input
    user_input = gets.chomp
end

# display_logo
def render_logo
    system("clear")
    logo = Artii::Base.new :font => 'slant'
    puts logo.asciify("The Pill Box")
end

def write_user(users)
    File.open("./files/user_info.json", "w") do |f|
        f.write(users.to_json)
    end
end

# def view_meds
#     puts "Can we re-confirm your password"
#     password = user_input
#     json = JSON.parse(File.read("./files/user_info.json"))
#     json.find do |key|
#         if key["Password"] == password
#             puts "Your current medications are:"

#         end 
#     end 
# end 

def view_meds
    prompt = TTY::Prompt.new
    password = prompt.mask("Can we please re-confirm your password", require: true)
    user_list = JSON.parse(File.read("./files/user_info.json"))
    user_list["Users"].each do |user|
        if user["Password"] == password
            user["Medication"].each do |med|
                puts med["Med_Name"].colorize(:pink)
            end
        end 
    end

end 

def add_new_med(name, med_data)
    user_list = JSON.parse(File.read("./files/user_info.json"))
    user_list["Users"].each do |user|
        if user["Name"] == name
            user["Medication"] << med_data
        end
    end 
    File.write("./files/user_info.json", JSON.generate(user_list))
end

def retrieve_meds(name)
    user_list = JSON.parse(File.read("./files/user_info.json"))
    user_list["Users"].each do |user|
        if user["Name"] == name
            user["Medication"].each do |med|
                puts "Name: #{med["Med_Name"]}"
                puts "Intake Time: #{med["Intake_Time"]}"
                puts "Duration: #{med["Duration"]}"
                puts "Extra Info: #{med["Extra_Info"]}"
            end
        end
    end
end

def profile_menu
    prompt = TTY::Prompt.new
    option_profile = prompt.select("What would you like to do?".colorize(:red)) do |menu|
        menu.enum "."
        menu.choice "View", 1
        menu.choice "Edit", 2
        menu.choice "Logout", 3
        end
    case option_profile
    when 1
    view_meds
    profile_menu
    when 2
    prompt = TTY::Prompt.new
    profile_select = prompt.select("What would you like to do?".colorize(:red)) do |menu|
        menu.enum "." 
        menu.choice "Add Medication", 1
        menu.choice "Update Medication", 2
        menu.choice "Delete Medication", 3
        menu.choice "Update Profile", 4
        end
        if profile_select == 1
            name = prompt.ask("Can we please confirm your username?", required: true).colorize(:pink)
            meds = prompt.ask("What medications would you like to add?", required: true).colorize(:pink)
            time = prompt.ask("When do you need to take this (e.g. Morning, Afternoon, Night, 2 times a day)?", required: true).colorize(:pink)
            duration = prompt.ask("How long do you need to take this for (e.g. 12 months, 6 months, 24 months)?", required: true).colorize(:pink)
            info = prompt.ask("When should you take the medication (options: before food, after food)", required: true).colorize(:pink)
            system("clear")
            med_data = {Med_Name: meds, Intake_Time: time, Duration: duration, Extra_Info: info}
            add_new_med(name, med_data)
            puts "Thank you! Here's your updated list"
            retrieve_meds(name)
            puts "Would you like to add anymore? (Y/N)"
            answer = user_input
            answer.capitalize!
            if answer == "Y"
                name = prompt.ask("Can we please confirm your username?", required: true).colorize(:pink)
                meds = prompt.ask("What medications would you like to add?", required: true).colorize(:pink)
                time = prompt.ask("When do you need to take this (e.g. Morning, Afternoon, Night, 2 times a day)?", required: true).colorize(:pink)
                duration = prompt.ask("How long do you need to take this for (e.g. 12 months, 6 months, 24 months)?", required: true).colorize(:pink)
                info = prompt.ask("When should you take the medication (options: before food, after food)", required: true).colorize(:pink)
                system("clear")
                med_data = {Med_Name: meds, Intake_Time: time, Duration: duration, Extra_Info: info}
                add_new_med(name, med_data)
                puts "press enter to return to menu".colorize(:red)
                profile_menu
            elsif answer == "N"
                profile_menu
            end 
        elsif profile_select == 2
            update_meds
        end 
    when 3 #need to fix logout
        render_logo
        system("clear")
        puts "Thank you! Have a Good Day!"
    else 
        puts "Invalid input"
    end 
end 



# def new_user
#     puts "Create your username:"
#     name = user_input
#     puts "Create your password:" 
#     password = user_input
#     puts "Please enter your email:"
#     email = user_input
#     system("clear")
#     puts "Welcome #{name}, Let's create your profile"
#     puts "What medications would you like to add?"
#     meds = user_input
#     puts "When do you need to take this (e.g. Morning, Afternoon, Night, 2 times a day)?"
#     time = user_input
#     puts "How long do you need to take this for (e.g. 12 months, 6 months, 24 months)?"
#     duration = user_input
#     puts "When should you take the medication (options: before food, after food)"
#     info = user_input
#     system("clear")
#     user = {Name: name, Password: password, Email: email, Medication: meds, Intake_Time: time, Duration: duration, Extra_Info: info}
#     users = JSON.parse(File.read("./files/user_info.json"))
#     users["users"] << user
#     write_user(users)
# end 
def update_meds
    prompt = TTY::Prompt.new
    name = prompt.ask("Please confirm your username", required: true)
    meds = prompt.ask("What medication would you like to update", required: true)
    new_meds = prompt.ask("What's the name of your new medication", required: true)
    time = prompt.ask("When do you need to take this (e.g. Morning, Afternoon, Night, 2 times a day)?", required: true)
    duration = prompt.ask("How long do you need to take this for (e.g. 12 months, 6 months, 24 months)?", required: true )
    info = prompt.ask("When should you take the medication (options: before food, after food)", required: true)
    update_meds = {Med_name: new_meds, Intake_Time: time, Duration: duration, Extra_Info: info}
    user_list = JSON.parse(File.read("./files/user_info.json"))
    user_list["Users"].each do |user|
        if user["Name"] == name && user["Med_Name"] == meds
            user["Medication"] << update_meds 
        elsif user["Name"] != name 
            puts "Invalid Username, Try again"
            profile_menu
        elsif user["Med_Name"] != meds 
            puts "This medication is currently not on your profile! Please try again"
            profile_menu
        end 
        File.write("./files/user_info.json", JSON.generate(user_list))
    end
end 

