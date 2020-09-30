# require_relative "./methods.rb"
# require_relative "./profile_method.rb"
# require "classes/classes.rb"
require "json"

class User

    def initialize(name,password,email)
        @name = name
        @password = password
        @email = email 
    end
    def write_user(users)
        File.open("files/user_info.json", "w") do |f|
            f.write(users.to_json)
        end
    
    end

 end

 
def user_input
    user_input = gets.chomp
end

users = []

user = User.new(name,password,email)
users << user 
user.write_user(users)
end

    # YAML.load(File.read 'files/user_info.yml') do |user| 
    #     users << user_pass
    # end 
    
    # File.open("files/user_info.yml", 'w') do |f| 
    #     f.write(users.to_yaml)
    # end
    # JSON.parse(File.read("files/user_info.json"), symbolize_names: true)

def login_new
    puts "Create your username:"
    name = user_input
    puts "Create your password:" 
    password = user_input
    puts "Please enter your email:"
    email = user_input
    puts "Welcome #{name}, Let's create your profile"
    # add_meds
    write_user(name, password, email)
end 

# p user_pass

def login_existing
    puts "Please enter your username"
    user_name_existing = user_input
    puts "Please enter your password"
    password_existing = user_input
    #error handling loop to retry enter username/password 
    if user_name_exisiting == user_pass && password_existing == user_pass
        puts profile_view 
    elsif user_name_existing != user_pass && password_exisiting == user_pass
        puts "Invalid Username"
    elsif user_name_exisiting == user_pass && password_exisiting != user_pass
        puts "Invalid Password"
    end
end

# adding medication
# def add_meds
#     puts "What medications would you like to add?"
#     meds = user_input
#     puts "When do you need to take this (e.g. Morning, Afternoon, Night, 2 times a day)?"
#         time = user_input
#         puts "How long do you need to take this for (e.g. 12 months, 6 months, 24 months)?"
#             duration = user_input
#             puts "When should you take the medication (options: before food, after food)"
#             info = user_input
# end
        
login_new

# if users[0] == [nil]
#     users[0] = [saving]
# else
#     users [0] << saving
# end

# user_pass = User.new(name, password, email)
# users = JSON.parse(File.read("files/user_info.json"), symbolize_names: true)
# users << user_pass
# File.write("files/user_info.json", JSON.generate(users))
    
    

