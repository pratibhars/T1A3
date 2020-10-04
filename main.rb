require_relative "methods/methods.rb"

require "artii"
require "colorize"
require "tty"
require "tty-prompt"
require "tty-table"
require "pony"
require "json"


#main

login = false
results = nil
prompt = TTY::Prompt.new

def command_argv(option)
    case option
    when "-h"
        puts "We're here to help".colorize(:purple)
        puts "Please create a username and password to login and create your account".colorize(:light_blue)
        puts "To navigate the app, please use the scrolling menu to select what you would like to do".colorize(:light_blue)
        puts "If you would like to add, update or delete, please go to the Profile menu option".colorize(:light_blue)
        puts "Hope this has helped! Thank you and enjoy the app".colorize(:purple)
        exit
    end
end

ARGV.each{ |opt| command_argv(opt) }
command_argv("-h")

# loop through the application 
loop do 
    render_logo

    #main menu choices

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
        option_login = prompt.select("New or Existing?".colorize(:red)) do |menu|
        menu.enum "."
        menu.choice "New", 1
        menu.choice "Existing", 2
        end
        #Create new login 
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
            user ={Name: name, Password: password, Email: email, Medication:[{Med_Name: meds, Intake_Time: time, Duration: duration, Extra_Info: info}]}
            user_list = JSON.parse(File.read("./files/user_info.json"))
            user_list["Users"] << user
            write_user(user_list)
            puts "Thank you #{name}, Your profile is now created".colorize(:green)
            profile_menu
        #Login through existing account option 
        elsif option_login == 2
            while results.nil?
                name = prompt.ask("Please enter your username:", required: true)
                password = prompt.mask("Please enter your password:", required: true)
                result = login_check(name, password)
            end 
        end 

    elsif option == 2
        puts "Welcome to The Pill Box".colorize(:light_blue)
        puts "The Pill Box allows you to easily store the medication, intake times, duration and additional information, the app will then send you reminder emails to your designated email account".colorize(:light_blue)
        puts "Use the up and down arrows to navigate the menu".colorize(:light_blue)
        puts "Thank you! Hope you enjoy this app".colorize(:light_blue)

    end 
    if option == 3
        profile_menu
    end 
    if option == 4
        puts "Thank you! Have a Good Day!"
        break  
    end 
    
end 
