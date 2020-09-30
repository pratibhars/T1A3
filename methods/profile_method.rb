# require_relative "methods/methods.rb"

def user_input
    user_input = gets.chomp
end

require "json"

profile_info = [{
    Medication: meds,
    Intake_Time: time, 
    Duration: duration, 
    Extra_Info: info
}]

File.open("files/med_info.json", "w") do |meds_info|
    meds_info.write(profile_info.to_json)
end
    # JSON.parse(File.read("files/profile_info.json"), symbolize_names: true)
# adding medication
def add_meds
    puts "What medications would you like to add?"
    meds = user_input
    puts "When do you need to take this (e.g. Morning, Afternoon, Night, 2 times a day)?"
    time = user_input
    puts "How long do you need to take this for (e.g. 12 months, 6 months, 24 months)?"
    duration = user_input
    puts "When should you take the medication (options: before food, after food)"
    info = user_input
    profile_info << meds
    profile_info << time
    profile_info << duration
    profile_info << info 
end



#stored in a json file - existing users
def profile_view 
    table = Terminal::Table.new :headings => [
        "Medication",
        "Intake Time",
        "Duration",
        "Extra Information"
    ], :rows => profile_info 
    puts table
end