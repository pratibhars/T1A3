require "artii"
require "tty-prompt"
require "colorize"
require "json"

users = JSON.parse(File.read("./files/user_info.json"))

#getting information from users
def user_input
    user_input = gets.chomp
end

# display_logo_pillbox
def render_logo
    system("clear")
    logo = Artii::Base.new :font => 'slant'
    puts logo.asciify("The Pill Box")
end

# method to write to json
def write_user(users)
    File.open("./files/user_info.json", "w") do |f|
        f.write(users.to_json)
    end
end



#conditional checks to ensure that users login if they have the right username/password
def login_check(name, password)
    result = nil
    begin 
        user_list = JSON.parse(File.read("./files/user_info.json"))
        user_list["Users"].each do |user|
            if user["Name"] == name && user["Password"] == password
                puts "Welcome back #{name}!"
                profile_menu
                result = "match"
            elsif user["Name"] == name && user["Password"] != password
                result = "invalid pw"
            end
        end
        puts "Sorry - those details couldn't be found" if result.nil?
        if result.nil?
            puts "Sorry - those details couldn't be found. Please try again"
        elsif result == "invalid pw"
            puts "User password detail Invalid. Please try again"
            result = nil
        end
        return result
    rescue Errno::ENOENT
        puts "We cannot find your details on file. Please create an account."
    end 

end

#this shows their current medications they have already listed in their account
def view_meds
    result = nil
    prompt = TTY::Prompt.new
    name = prompt.ask("Can we please re-confirm your username", require: true)
    begin 
        user_list = JSON.parse(File.read("./files/user_info.json"))
        user_list["Users"].each do |user|
            if user["Name"] == name
                user["Medication"].each do |med|
                    puts "Name: #{med["Med_Name"]}"
                    puts "Intake Time: #{med["Intake_Time"]}"
                    puts "Duration: #{med["Duration"]}"
                    puts "Extra Info: #{med["Extra_Info"]}"
                end
                result = 1
            end
        end
            if result != 1
                puts "Invalid details, Please Try again"
                profile_menu
            end
    rescue Errno::ENOENT
        puts "We're not able to the medications on file. Please check your list or add it in"
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
            name = nil
            while name.nil?
                puts "Can we please confirm your username?"
                name = gets.chomp
            end
    
            meds = prompt.ask("What medications would you like to add?", required: true).colorize(:pink)
            time = prompt.ask("When do you need to take this (e.g. Morning, Afternoon, Night, 2 times a day)?", required: true).colorize(:pink)
            duration = prompt.ask("How long do you need to take this for (e.g. 12 months, 6 months, 24 months)?", required: true).colorize(:pink)
            info = prompt.ask("When should you take the medication (options: before food, after food)", required: true).colorize(:pink)
            system("clear")
            med_data = {Med_Name: meds.to_s, Intake_Time: time.to_s, Duration: duration.to_s, Extra_Info: info.to_s}
            add_new_med(name, med_data)
            puts "Thank you! Here's your updated list"
            retrieve_meds(name)
            puts "Would you like to add anymore? (Y/N)"
            answer = user_input
            if answer == "Y"
                name = prompt.ask("Can we please confirm your username?", required: true).colorize(:pink)
                meds = prompt.ask("What medications would you like to add?", required: true).colorize(:pink)
                time = prompt.ask("When do you need to take this (e.g. Morning, Afternoon, Night, 2 times a day)?", required: true).colorize(:pink)
                duration = prompt.ask("How long do you need to take this for (e.g. 12 months, 6 months, 24 months)?", required: true).colorize(:pink)
                info = prompt.ask("When should you take the medication (options: before food, after food)", required: true).colorize(:pink)
                system("clear")
                med_data ={Med_Name: meds.to_s, Intake_Time: time.to_s, Duration: duration.to_s, Extra_Info: info.to_s}
                add_new_med(name, med_data)
                puts "press enter to return to menu".colorize(:red)
                profile_menu
            elsif answer == "N"
                profile_menu
            end 
        elsif profile_select == 2
            update_meds
        elsif profile_select == 3

        end 
    when 3 #need to fix logout
        render_logo
        system("clear")
        puts "Thank you! Have a Good Day!"
    else 
        puts "Invalid input"
    end 
end 

def update_meds
    prompt = TTY::Prompt.new
    meds = prompt.ask("What medication would you like to update", required: true)
    new_meds = prompt.ask("What's the name of your new medication", required: true)
    new_time = prompt.ask("When do you need to take this (e.g. Morning, Afternoon, Night, 2 times a day)?", required: true)
    new_duration = prompt.ask("How long do you need to take this for (e.g. 12 months, 6 months, 24 months)?", required: true )
    new_info = prompt.ask("When should you take the medication (options: before food, after food)", required: true)
    update_meds = {Med_name: new_meds, Intake_Time: new_time, Duration: new_duration, Extra_Info: new_info}
    begin 
        user_list = JSON.parse(File.read("./files/user_info.json"))
        user_list["Users"].each do |user|
            user["Medication"] == true if user_list.has_value?("meds")
                user["Medication"] = update_meds
            File.write("./files/user_info.json", JSON.generate(user_list))
        end 
    rescue Errno::ENOENT
        puts "We're not able to find this medication. Please check your list or add it in"
    end
end
