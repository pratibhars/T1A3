require "artii"
require "tty-prompt"
require "colorize"

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

# home_menu 

#login_menu

#help_menu 


#profile 

#edit

#Logo and Menu Options





