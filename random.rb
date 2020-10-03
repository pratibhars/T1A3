# require "terminal-table"
require_relative "methods/methods.rb"
require "artii"
require "colorize"
require "tty"
require "tty-prompt"
require "terminal-table"
require "json"

# users_info = JSON.parse(File.read("./files/user_info.json"))

# def write_user(users_info)
#     File.open("./files/user_info.json", "w") do |f|
#         f.write(users.to_json)
#     end
# end
name = prompt.ask("Please confirm your username", required: true)
meds = prompt.ask("What medication would you like to update?", required: true)
new_meds = prompt.ask ("What medication would you like to update this to?", required: true)
time = prompt.ask("When do you need to take this (e.g. Morning, Afternoon, Night, 2 times a day)?", required: true)
duration = prompt.ask("How long do you need to take this for (e.g. 12 months, 6 months, 24 months)?", required: true)
info = prompt.ask("When should you take the medication (options: before food, after food)", required: true)
update_meds =
def update_meds

        
end

def add_new_med(name, med_data)
    user_list = JSON.parse(File.read("./files/user_info.json"))
    user_list["Users"].each { |user|
        if user["Name"] == name
            user["Medication"] << med_data
        end
    }
    File.write("./files/user_info.json", JSON.generate(user_list))
end

def retrieve_meds(name)
    user_list = JSON.parse(File.read("./files/user_info.json"))
    user_list["Users"].each { |user|
        if user["Name"] == name
            user["Medication"].each { |med|
                puts "Name: #{med["Med_Name"]}"
                puts "Intake Time: #{med["Intake_Time"]}"
                puts "Duration: #{med["Duration"]}"
                puts "Extra Info: #{med["Extra_Info"]}"
            }
        end
    }
end

prompt = TTY::Prompt.new

name = prompt.ask("Can we please confirm your username?", required: true)
meds = prompt.ask("What medications would you like to add?", required: true)
time = prompt.ask("When do you need to take this (e.g. Morning, Afternoon, Night, 2 times a day)?", required: true)
duration = prompt.ask("How long do you need to take this for (e.g. 12 months, 6 months, 24 months)?", required: true)
info = prompt.ask("When should you take the medication (options: before food, after food)", required: true)
system("clear")
med_data = {Med_Name: meds, Intake_Time: time, Duration: duration, Extra_Info: info}
add_new_med(name, med_data)
retrieve_meds(name)

