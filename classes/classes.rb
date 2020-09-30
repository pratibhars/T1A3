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

 