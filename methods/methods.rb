# require "artii"
# require "tty"

# display_logo
def render_logo
    system("clear")
    logo = Artii::Base.new :font => 'slant'
    puts logo.asciify("The Pill Box")
end

# home_menu 
def home_menu
    prompt = TTY::Prompt.new
    prompt.select("Welcome to the Pill Box!".colorize(:red)) do |menu|
        menu.enum "."
        menu.choice "Login", 1
        menu.choice "Help", 2
        menu.choice "Logout", 3
    end
end

#login_menu
def login_menu
    prompt = TTY::Prompt.new
    prompt.select("New or Existing?".colorize(:red)) do |menu|
        menu.enum "."
        menu.choice "New", 1
        menu.choice "Existing", 2
    end
end

#help_menu 
def help_menu
    prompt = TTY::Prompt.new
    prompt.select("How can we help?".colorize(:red)) do |menu|
        menu.enum "."
        menu.choice "Help", 1
        menu.choice "Home", 2
    end
end

#profile 
def profile_menu
    prompt = TTY::Prompt.new
    prompt.select("What would you like to do?".colorize(:red)) do |menu|
        menu.enum "."
        menu.choice "View", 1
        menu.choice "Edit", 2
        menu.choice "Logout", 3
    end
end

#edit
def edit_menu
    prompt = TTY::Prompt.new
    prompt.select("What would you like to do?".colorize(:red)) do |menu|
        menu.enum "." 
        menu.choice "Add Medication", 1
        menu.choice "Update Medication", 2
        menu.choice "Delete Medication", 3
        menu.choice "Update Profile", 4
        menu.choice "Profile", 5
    end 
end 

# Login 
#     New
#         Create username and password
#             gets input 
#         Create profile
#             gets input 
#                 - medication
#                 - time frame
#                 - intake time
#                 - extra requirements 
#             store profile in a file
#         puts "Would you like to view your profile (Y/N)"
#             if yes 
#                 move to profile view
#             elsif no 
#                 move to home screen 
#             end 
#     Existing
#         Enter username and password 
#             gets input
#             validate input against file data
#             if username and password == file.username and password
#                 then open their profile 
#             elsif username and password != file.username and password
#                 puts "Username and password don't match, Please try again!"
#                 retry
#             end
#         profile screen
#             - view
#                 Table view - Current medication, Intake time, duration and extra info
#             - edit
#                 - Add Meds
#                     puts "Please add your new medications"
#                         gets input
#                         gets. capitalize  
#                     puts "Would you like to add anymore (Y/N)"
#                         gets input 
#                         gets.capitalize!
#                         if "y" == gets input 
#                             then return Add Meds
#                         elsif "n" == gets input 
#                             then return to Profile 
#                         end 
#                 - Update Meds
#                 - Delete Meds
#                 - Update Profile 
#                 - Profile 
#             - logout 

        
#     Home
# End

# Help 
#     How to
#     Home
# End 

# Logout
#     puts "Have a nice day"
#     Exit App 
# End 


