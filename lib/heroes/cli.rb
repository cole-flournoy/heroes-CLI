class Heroes::CLI
    
    @@index = []
    @@random = (1..731).to_a.shuffle
    
    def self.index 
        @@index
    end

    def self.random
        @@random
    end

    def call
        puts "\nWelcome! If you're looking to learn more about Superheroes or Villains across many universes. You've come to the right place." 
        puts "Ever wonder what would happen if Yoda fought Batman? ...Let's find out"
        menu
        puts "\nSee you next time!"
    end

    def menu
        input = nil
        while input != "quit"
            menu_display
            input = gets.strip.downcase
            case input
            when "search"
                search
            when "random"
                random
            when "index"
                print_index
            when "fight"
                if Heroes::Character.fighters.length == 1
                    puts "Ready to resume your fight with #{Heroes::Character.fighters[0].name}? Let's find them an opponent!"
                else
                    puts "\nAll fights are 1v1. Let's start by searching for your first character:"
                end
                search
            when "help"
                help
            when "quit"
                break
            else
                puts "Invalid input. For more info on the program or any commands, type 'help'\n\n"
            end 
        end

    end

    def menu_display
        puts "\n* "
        puts "* MENU ACTIONS: 'search' - 'random' - 'index' - 'fight' - 'help' - 'quit' "
        puts "* (You can return to this Menu at any time by typing 'menu')"
        puts "* \n\n"
    end

    def search
        results = find_results
        unless results == nil   
            display_results(results)
            select_result(results)
        end
    end

    def find_results
        puts "We have over 700 characters. What character would you like to know more about?"
        input = gets.strip
        unless input.downcase == 'menu' 
            results = Heroes::Search.by_name(input)
            if results["response"] == "error"
                puts "I'm sorry, we couldn't find anything from the search '#{input}'. \nPro Tip: You can also search using part of a word (ie. 'Super' or 'bat') to get more results!\n\n"
                find_results
            else
                output = {}
                count = 1
                results["results"].each do |result| 
                    output[count.to_s.to_sym] = [count, result["id"], result["name"], result["biography"]["full-name"]]              # - #{result["biography"]["full-name"]}"}  
                    count += 1
                end
                output
            end
        end
    end

    def display_results(results)
        puts "Your search yielded the following result(s):" 
        results.each do |key, value| 
            if value[3].length > 1
                puts "      #{value[0]} - #{value[2]} (#{value[3]})" 
            else
                puts "      #{value[0]} - #{value[2]}"
            end
        end
    end

    def select_result(results) 
        puts "If you see the name of the character you were looking for, simply type the number to the left of your character and press 'Enter'"
        puts "Otherwise, type 'new' for a new search"
        input = gets.strip
        unless input.downcase == "menu"
            if input.downcase == "new"
                search
            elsif input.to_i != 0 && input.to_i <= results.length
                id = results[input.to_sym][1]
                match = Heroes::Character.all.select{|character| character.id == id}
                binding.pry
                match = match[0]
                
                if match == nil
                    json_obj = Heroes::Search.by_id(id)
                    @@random.delete(id.to_i)
                    character = Heroes::Character.new(json_obj) 
                    character.detail
                    ##
                else
                    match.detail
                end 
                
                puts "If you'd like to save this character for a 1v1 fight type 'fight'. If you'd like to return to the Menu, type anything else (hitting 'Enter' will also work fine)."
                fight_response = gets.strip.downcase
                if fight_response == "fight"
                    if match == nil
                        Heroes::Character.fighters << character
                    else
                        if Heroes::Character.fighters.include?(match)
                            puts "Sorry, the same person can't fight themself"
                            search
                        else
                            Heroes::Character.fighters << match
                        end
                    end
                    
                    if Heroes::Character.fighters.length == 2 
                        Heroes::Character.fight
                    else
                        puts "\nGreat, lets find their opponent!"
                        search
                    end
                else
                    ""
                end
                
            else
                puts "Invalid entry \n\n"
                select_result(results)
            end
        end
    end

    def random
        id = @@random.pop
        json_obj = Heroes::Search.by_id(id)
        character = Heroes::Character.new(json_obj)
        character.detail
    end

    def print_index 
        if @@index == []
            request = Heroes::GetReq.new("https://superheroapi.com/ids.html")
            list = request.scrape_index
            @@index = list
        else
            list = @@index
        end

        count = 0
        number = (list.length / 3) + 1 
        number.times do |i| 
            if i + 1 == number
                puts list[count][0].rjust(3).ljust(2) + ". " + list[count][1].ljust(20) + list[count+1][0].ljust(2) + ". " + list[count+1][1].ljust(20) + "\n\n\n"
            else
                puts list[count][0].rjust(3).ljust(2) + ". " + list[count][1].ljust(20) + list[count+1][0].rjust(3).ljust(2) + ". " + list[count+1][1].ljust(20) + list[count+2][0].rjust(3).ljust(2) + ". " + list[count+2][1].ljust(20)
            end
            count += 3
        end
    end

    def help
        puts "\nWelcome to the HELP page! The purpose of this program is to play around with Superheroes and hopefull discover something new."
        puts "We have over 700 Heroes/Villains from a variety of different universes, and this is what you can do with them:"
        puts "\nCOMMANDS:"
        puts "'search'".rjust(15) + "\n - Search all of our characters by name ('Superman'), or even by part of their name ('super'). The more specific you are in your search, the fewer results you will be shown.\n\n"
        puts "'random'".rjust(15) + "\n - Randomly generates a new Hero ro Villain from our list. Great for discovering a new character, or learning more about a character you're not as familiar with.\n\n"
        puts "'index'".rjust(15) + "\n - Lists all 731 characters in case you need help thinking of a name to search.\n\n"
        puts "'fight'".rjust(15) + "\n - Ever wonder whether Harry Potter could beat Spiderman in a fight? Us too! Select two characters, and compare their stats to determine a winner.\n\n"
        puts "'quit'".rjust(15) + "\n - Exits the program and resets all stored data.\n\n"
    end
    

end