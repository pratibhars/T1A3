# class User

#     def initialize(name,password,email)
#         @name = name
#         @password = password
#         @email = email 
#     end
#     def write_user(users)
#         File.open("files/user_info.json", "w") do |f|
#             f.write(users.to_json)
#         end
    
#     end

#  end




#  class Profile
#     attr_accessor :medication, :intake_time, :duration, :extra_info

#     def initialize
#         @medication = medication 
#         @intake_time = intake_time 
#         @duration = duration
#         @extra_info = extra_info
#     end 


# end 

# def write_profiles
#     new_profile = {medication: "medication", intake_time: "intake_time", duration: "duration", extra_info: "extra_info"}
#     profile_list = JSON.parse(File.read("./files/profile_info.json"))
#     profile_list << new_profile
#     File.write("./files/profile_info.json", JSON.generate(profile_list))
# end
require "artii"
require "json"

def render_logo
    system("clear")
    logo = Artii::Base.new :font => 'slant'
    puts logo.asciify("The Pill Box")
end


users = JSON.parse(File.read("./files/user_info.json"))

def write_user(users)
    File.open("./files/user_info.json", "w") do |f|
        f.write(users.to_json)
    end
end

def user_input
    user_input = gets.chomp
end

def view_meds
    json = JSON.parse(File.read("./files/user_info.json"))
    json.find do |key|
        name = "Prats"
        medication = "vitamin x"
        if key["Name"] == name and key["Medication"] == medication
            puts "Welcome #{name}"
            puts "Your current medications are:"
            puts "#{medication}"
        end 
    end 
end 

view_meds

def new_user
    puts "Create your username:"
    name = user_input
    puts "Create your password:" 
    password = user_input
    puts "Please enter your email:"
    email = user_input
    system("clear")
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
    user = {Name: name, Password: password, Email: email, Medication: meds, Intake_Time: time, Duration: duration, Extra_Info: info}
    users = JSON.parse(File.read("./files/user_info.json"))
    users << user
    write_user(users)
end 

def update_meds
end 



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
# profile = {Name: name, Password: password, Email: email, Medication: meds, Intake_Time: time, Duration: duration, Extra_Info: info}
# profiles = JSON.parse(File.read("./files/profile_info.json"))
# profiles << profile
# write_profile(profiles)