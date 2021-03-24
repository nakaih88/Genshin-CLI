class CLI

    def call
        puts "Welcome to the list of Genshin Impact characters!"
        Scraper.scrape_characters
        start
    end

    def start
        puts ""
        puts "What character would you like to have a look at?"

        Character.all.each.with_index(1) do | character, i|
            puts "#{i}. #{character.name}"
        end

        input = gets.chomp
        if !input.to_i.between?(1, Character.all.count)
            puts "Please input a correct number."
            puts ""

            start

        else
            character = Character.all[input.to_i-1]
            display_char_details(character)
        end
    end

    def display_char_details(char)
        Scraper.scrape_ind_characters(char)
        puts " __| |____________________________________________| |__"
        puts "(__   ____________________________________________   __)"
        puts "   | |                                            | |"
        puts "                   #{char.name} : #{char.title}"
        puts "#{char.gender.gsub("\n",'').gsub("\t",': ').gsub("Sex", "Gender")}"
        puts "#{char.nation.gsub("\n",'').gsub("\t",': ')}"
        puts "#{char.affiliation.gsub("\n",'').gsub("\t",': ')}"
        puts "#{char.birthday.gsub("\n",'').gsub("\t",': ')}"
        puts "#{char.title2}"
        puts "#{char.title3}"
        puts " __| |____________________________________________| |__"
        puts "(__   ____________________________________________   __)"
        puts "   | |                                            | |"
        puts "                     Constellation"
        puts "#{char.constellation.gsub("\n",'').gsub("\t",'').gsub("Constellation", "")}"
        puts " __| |____________________________________________| |__"
        puts "(__   ____________________________________________   __)"
        puts "   | |                                            | |"
        puts "                      More Info"
        puts "#{char.url}"
        puts " __| |____________________________________________| |__"
        puts "(__   ____________________________________________   __)"
        puts "   | |                                            | |"
        puts ""

        puts "Would you like to view another characters information? Please input Y or N"
        input = gets.strip.downcase
        if input == "y"
          start
        elsif input == "n"
          puts ""
          puts "Goodbye!"
        else
          puts ""
          puts "Please input Y or N"
          start
        end
    end

end


