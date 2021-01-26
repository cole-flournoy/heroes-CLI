class Heroes::Character
    attr_accessor :id, :name, :fullname, :powerstats, :place_of_birth, :alignment, :height, :weight, :occupation, :image
    
    @@all = []
    @@fighters = []
    
    def initialize(json_obj)
        @id = json_obj["id"]
        @name = json_obj["name"] 
        @fullname = json_obj["biography"]["full-name"]
        @powerstats = json_obj["powerstats"] 
        @place_of_birth = json_obj["biography"]["place-of-birth"]
        @alignment = json_obj["biography"]["alignment"]
        @height = json_obj["appearance"]["height"]
        @weight = json_obj["appearance"]["weight"] 
        @occupation = json_obj["work"]["occupation"]
        @image = json_obj["image"]["url"]
        
        @@all << self
    end

    def self.all
        @@all
    end

    def self.fighters
        @@fighters
    end

    def self.fight
        fighter_one_stats = 0
        puts "#{@@fighters[0].name}: ".rjust(@@fighters[0].name.length + 5)
        @@fighters[0].powerstats.each do |attribute, score|
            fighter_one_stats += score.to_i
            puts "#{attribute}: #{score.to_i}".rjust(25)
        end
        
        fighter_two_stats = 0
        puts "#{@@fighters[1].name}: ".rjust(@@fighters[1].name.length + 5)
        @@fighters[1].powerstats.each do |attribute, score|
            fighter_two_stats += score.to_i
            puts "#{attribute}: #{score.to_i}".rjust(25)
        end
        if fighter_one_stats > fighter_two_stats
            puts "\nIt seems pretty clear that #{@@fighters[0].name} would win this one\n\n"
        elsif fighter_one_stats < fighter_two_stats
            puts "\nIt seems pretty clear that #{@@fighters[1].name} would win this one\n\n"
        elsif fighter_one_stats == fighter_two_stats
            puts "\nThis fight's too close to call. It's a draw!\n\n"
        end
    
        @@fighters = []
        puts "When you're done looking at your fight results, simply press 'Enter' to return to the Menu!"
        input = gets.strip
    end
    
    def detail
        puts "      Name: ".ljust(30) + self.name
        puts "      Full Name: ".ljust(30) + self.has_attribute?('fullname')
        puts "      Hero or Villain?: ".ljust(30) + self.good_vs_evil
        puts "      Place of Birth: ".ljust(30) + self.has_attribute?('place_of_birth')
        self.occupation_display
        puts "      Height: ".ljust(30) + self.has_attribute?('height')
        puts "      Weight: ".ljust(30) + self.has_attribute?('weight')
        puts "      Power Stats: ".ljust(30)
        self.stats_detail
        puts "And if you'd like to know what they look like, click on this url: \n#{self.image.ljust(6)} \n\n" 
    end 

    def has_attribute?(attribute)
        if self.send(attribute) == "" || self.send(attribute)[0] == "-" || self.send(attribute)[0][0] == "-"
            "Unknown"
        elsif self.send(attribute).kind_of?(Array)
            self.send(attribute)[0]
        else
            self.send(attribute)
        end
    end

    def good_vs_evil
        case self.alignment
        when "good"
            "Hero"
        when "bad"
            "Villain"
        when "neutral"
            "Neutral"
        else
            "Unknown"
        end
    end

    def stats_detail
        self.powerstats.each{|key, value| puts "#{value}: ".rjust(19) + key.capitalize.rjust(3)}
    end

    def too_long?(string)
        string.length > 25 && string.split(", ").length > 1
    end

    def occupation_display
        if self.too_long?(has_attribute?('occupation'))
            puts "      Occupation: ".ljust(30)
            jobs = has_attribute?('occupation').split(", ")
            jobs.each{|item| puts item.capitalize.rjust(item.length + 17)}
            puts "\n"
        else
            puts "      Occupation: ".ljust(30) + self.has_attribute?('occupation')
        end
    end
end 